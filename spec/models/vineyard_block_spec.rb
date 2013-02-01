require 'spec_helper'

describe VineyardBlock do

  describe 'database' do 

    describe 'columns' do 

      %w[created_at updated_at
        ].each do |column|
        it { should have_db_column(column.to_sym).of_type(:datetime) }
      end

      %w[vineyard_id block_id].each do |column|
        it { should have_db_column(column.to_sym).of_type(:integer) }
      end
    end

    describe 'indexes' do 

      it { should have_db_index(:block_id)}
      it { should have_db_index(:vineyard_id) }
      it { should have_db_index([:vineyard_id, :block_id]).unique(true) }
    end
  end



end
