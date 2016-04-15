
CXX=g++
STRIP=strip
CXXFLAGS=-O2 -ggdb -fPIC -std=c++11

MICRORESTD_VERSION := 0.9.0-devel

MICRORESTD_OBJECTS := \
 connection.o \
 connection_https.o \
 daemon.o \
 internal.o \
 memorypool.o \
 postprocessor.o \
 reason_phrase.o \
 response.o \
 w32functions.o

REST_SERVER_OBJECTS := \
 json_builder.o \
 json_response_generator.o \
 rest_server.o \
 version.o

MICRORESTD_LIBRARIES_POSIX := pthread
MICRORESTD_LIBRARIES_WIN := ws2_32

OBJS := $(MICRORESTD_OBJECTS:%=cxxhttpsrv/libmicrohttpd/%) $(REST_SERVER_OBJECTS:%=cxxhttpsrv/rest_server/%)

%.o:	%.cpp
	$(CXX) $(CXXFLAGS) -o $@ -c $<

all:	$(OBJS)
	$(CXX) -shared -o libcxxhttpserver.so $(OBJS)
	$(STRIP) -s libcxxhttpserver.so

clean:
	rm -f $(OBJS) libcxxhttpserver.so libcxxhttpserver.dll

install:
	install -D libcxxhttpserver.so $(DESTDIR)/usr/lib64/libcxxhttpserver.so

	install -D cxxhttpsrv/microrestd.h $(DESTDIR)/usr/include/cxxhttpsrv/microrestd.h
	install -D cxxhttpsrv/rest_server/json_builder.h $(DESTDIR)/usr/include/cxxhttpsrv/rest_server/json_builder.h
	install -D cxxhttpsrv/rest_server/json_response_generator.h $(DESTDIR)/usr/include/cxxhttpsrv/rest_server/json_response_generator.h
	install -D cxxhttpsrv/rest_server/response_generator.h $(DESTDIR)/usr/include/cxxhttpsrv/rest_server/response_generator.h
	install -D cxxhttpsrv/rest_server/rest_request.h $(DESTDIR)/usr/include/cxxhttpsrv/rest_server/rest_request.h
	install -D cxxhttpsrv/rest_server/rest_service.h $(DESTDIR)/usr/include/cxxhttpsrv/rest_server/rest_service.h
	install -D cxxhttpsrv/rest_server/rest_server.h $(DESTDIR)/usr/include/cxxhttpsrv/rest_server/rest_server.h
	install -D cxxhttpsrv/rest_server/string_piece.h $(DESTDIR)/usr/include/cxxhttpsrv/rest_server/string_piece.h
	install -D cxxhttpsrv/rest_server/version.h $(DESTDIR)/usr/include/cxxhttpsrv/rest_server/version.h




