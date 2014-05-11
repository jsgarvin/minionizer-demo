class Demo < Minionizer::RoleTemplate

  def call
    # Digital Ocean servers are initially created with only a root account
    # that you ssh in with. Let's change that.
    if root_connection_successful?
      @new_username = 'minionizer'

      # First let's create a new user to use instead of root for server management.
      Minionizer::UserCreation.new(root_session, username: @new_username, name: 'Minionizer').call

      # Then we upload our public keys to the new user.
      Minionizer::PublicSshKeyInjection.new(root_session, target_username: @new_username).call

      # Now we want to upload a new ssh config with more secure settings.
      Minionizer::FileInjection.new(
        root_session,
        target_path: '/etc/ssh/sshd_config',
        source_path: 'data/sshd_config',
        owner: 'root',
        group: 'root',
        mode: 644
      ).call

    end
  end

  private

  def root_connection_successful?
    root_session.exec('whoami')[:stdout].strip == 'root'
  rescue Net::SSH::AuthenticationFailed
    return false
  end

  def root_session
    @root_session ||= Minionizer::Session.new(session.fqdn, 'username' => 'root')
  end

end
