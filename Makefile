# This Makefile was generated by the Cake3
# https://github.com/grwlf/cake3

GUARD = .cake3/GUARD_$(1)_$(shell echo $($(1)) | md5sum | cut -d ' ' -f 1)

ifeq ($(MAIN),1)
unexport MAIN

# Main section

URCPP = $(shell $(shell urweb -print-ccompiler) -print-prog-name=g++)
URINCL = -I$(shell urweb -print-cinclude) 
URVERSION = $(shell urweb -version)
.PHONY: all
all: ./Test.exe ./Test.sql ./Test2.exe ./Test2.sql
.PHONY: clean
clean: 
	rm -rf .cake3 ./Test.sql ./Test.exe
.PHONY: db
db: ./Test2.exe ./Test2.sql
	dropdb --if-exists urweb-callback-db
	createdb urweb-callback-db
	psql -f ./Test2.sql urweb-callback-db
./Test2.exe: .fix-multy2
./Test2.urp: ./Test2.urp.in
	cat ./Test2.urp.in > ./Test2.urp
./Test2.urp.in: ./Test2.ur ./Test2.urs ./lib.urp
	touch ./Test2.urp.in
./Test.exe: .fix-multy1
./Test.urp: ./Test.urp.in
	cat ./Test.urp.in > ./Test.urp
./Test.urp.in: ./Test.ur ./Test.urs ./lib.urp
	touch ./Test.urp.in
./lib.urp: ./lib.urp.in
	cat ./lib.urp.in > ./lib.urp
./lib.urp.in: ./Callback.h ./Callback.o
	touch ./lib.urp.in
./Callback.o: ./Callback.cpp $(call GUARD,URCPP) $(call GUARD,URINCL)
	$(URCPP) -c $(URINCL) -std=c++11 -o ./Callback.o ./Callback.cpp
./Test.sql: .fix-multy1
./Test2.sql: .fix-multy2
.INTERMEDIATE: .fix-multy1
.fix-multy1: ./Test.urp $(call GUARD,URVERSION)
	urweb -dbms postgres ./Test
.INTERMEDIATE: .fix-multy2
.fix-multy2: ./Test2.urp $(call GUARD,URVERSION)
	urweb -dbms postgres ./Test2
$(call GUARD,URCPP):
	rm -f .cake3/GUARD_URCPP_*
	touch $@
$(call GUARD,URINCL):
	rm -f .cake3/GUARD_URINCL_*
	touch $@
$(call GUARD,URVERSION):
	rm -f .cake3/GUARD_URVERSION_*
	touch $@

else

# Prebuild/postbuild section

export MAIN=1

.PHONY: all
all: .fix-multy1
.PHONY: clean
clean: .fix-multy1
.PHONY: db
db: .fix-multy1
.PHONY: ./Test2.exe
./Test2.exe: .fix-multy1
.PHONY: ./Test2.urp
./Test2.urp: .fix-multy1
.PHONY: ./Test2.urp.in
./Test2.urp.in: .fix-multy1
.PHONY: ./Test.exe
./Test.exe: .fix-multy1
.PHONY: ./Test.urp
./Test.urp: .fix-multy1
.PHONY: ./Test.urp.in
./Test.urp.in: .fix-multy1
.PHONY: ./lib.urp
./lib.urp: .fix-multy1
.PHONY: ./lib.urp.in
./lib.urp.in: .fix-multy1
.PHONY: ./Callback.o
./Callback.o: .fix-multy1
.PHONY: ./Test.sql
./Test.sql: .fix-multy1
.PHONY: ./Test2.sql
./Test2.sql: .fix-multy1
.INTERMEDIATE: .fix-multy1
.fix-multy1: 
	-mkdir .cake3
	$(MAKE) -f ./Makefile $(MAKECMDGOALS)

endif
