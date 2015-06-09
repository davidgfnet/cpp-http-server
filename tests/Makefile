
CXX=g++
CXXFLAGS=-O2 -ggdb -fPIC -std=c++11
LDFLAGS= -lcxxhttpserver -lpthread

TARGETS = compile_test json_builder_test fileserver # libmicrohttpd_fileserver


%:	%.cpp
	$(CXX) -o $@ $< $(CXXFLAGS) $(LDFLAGS)

all:	$(TARGETS)
	

clean:
	rm -f $(TARGETS)

