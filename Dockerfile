FROM syneblock/quorum-maker:2.2.0_2.6.1

COPY qm.variables ./tmp/

COPY setup.sh ./tmp/

COPY ./lib ./tmp/lib

EXPOSE 22000 22001 22002 22003 22004 22005

ENV quorum_maker=/quorum-maker

VOLUME ["/$quorum_maker"]

