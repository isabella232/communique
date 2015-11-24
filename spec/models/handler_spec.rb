require "spec_helper"
describe Communique::Handler do
  describe '#external_services' do
    context 'no config block' do

      it 'works with no config block' do
        expect(Communique::Handler).to receive(:external_services).and_return nil

        dummy = NotifiableDummy.create
        Communique.notify(
          dummy,
          'death_star_deadlock',
          name: 'locked star',
          location: 'it moves really fast'
        )
      end
    end

    context 'with config block' do
      before(:each) do

        Communique.configure do |config|
          config.set_notification_handler do |notification, action|


          end
        end
      end

      it 'external block gets called' do
       #expect(Communique::Handler).to receive(:external_services).and_return nil

        dummy = NotifiableDummy.create
        Communique.notify(
          dummy,
          'death_star_deadlock',
          name: 'locked star',
          location: 'it moves really fast'
        )
      end
    end
  end
end