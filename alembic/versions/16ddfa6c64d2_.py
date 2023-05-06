"""empty message

Revision ID: 16ddfa6c64d2
Revises: b9a3e677f388
Create Date: 2023-05-05 10:41:36.392441

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '16ddfa6c64d2'
down_revision = 'b9a3e677f388'
branch_labels = None
depends_on = None


def upgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('sensors', sa.Column('upper_limit', sa.Integer(), nullable=True))
    op.add_column('sensors', sa.Column('lower_limit', sa.Integer(), nullable=True))
    # ### end Alembic commands ###


def downgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_column('sensors', 'lower_limit')
    op.drop_column('sensors', 'upper_limit')
    # ### end Alembic commands ###
