FROM  cyberdojofoundation/javascript-node:8.4.0
LABEL maintainer=jon@jaggersoft.com

# reinstall npm. See https://github.com/npm/npm/issues/14232
RUN rm -rf /usr/local/lib/node_modules/npm
RUN n latest

RUN npm install -global qunit chai sinon sinon-chai

ENV NODE_PATH /usr/lib/node_modules

COPY red_amber_green.rb /usr/local/bin
