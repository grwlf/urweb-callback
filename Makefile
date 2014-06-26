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
all: ./Makefile ./demo/Demo2.db ./demo/Demo2.exe ./demo/Demo2.sql ./test/Stress.db ./test/Stress.exe ./test/Stress.sql ./test2/Simple1.db ./test2/Simple1.exe ./test2/Simple1.sql ./test2/Stdout.db ./test2/Stdout.exe ./test2/Stdout.sql ./test2/Stress.db ./test2/Stress.exe ./test2/Stress.sql
./demo/Demo2.db: ./Makefile ./demo/Demo2.exe ./demo/Demo2.sql
	dropdb --if-exists Demo2
	createdb Demo2
	psql -f ./demo/Demo2.sql Demo2
	touch ./demo/Demo2.db
./test2/Stress.db: ./Makefile ./test2/Stress.exe ./test2/Stress.sql
	dropdb --if-exists Stress
	createdb Stress
	psql -f ./test2/Stress.sql Stress
	touch ./test2/Stress.db
./test2/Stdout.db: ./Makefile ./test2/Stdout.exe ./test2/Stdout.sql
	dropdb --if-exists Stdout
	createdb Stdout
	psql -f ./test2/Stdout.sql Stdout
	touch ./test2/Stdout.db
./test2/Simple1.db: ./Makefile ./test2/Simple1.exe ./test2/Simple1.sql
	dropdb --if-exists Simple1
	createdb Simple1
	psql -f ./test2/Simple1.sql Simple1
	touch ./test2/Simple1.db
./test/Stress.db: ./Makefile ./test/Stress.exe ./test/Stress.sql
	dropdb --if-exists Stress
	createdb Stress
	psql -f ./test/Stress.sql Stress
	touch ./test/Stress.db
.PHONY: lib
lib: ./Makefile ./lib.urp
.PHONY: demo
demo: ./Makefile ./demo/Demo2.db
./demo/Demo2.exe: .fix-multy1
./demo/Demo2.urp: ./Makefile ./demo/Demo2.ur ./demo/Demo2.urs ./lib.urp .cake3/tmp5
	cat .cake3/tmp5 > ./demo/Demo2.urp
.cake3/tmp5: ./Makefile
	-rm -rf .cake3/tmp5
	echo 'database dbname=Demo2' >> .cake3/tmp5
	echo 'safeGet Demo2/main' >> .cake3/tmp5
	echo 'safeGet Demo2/monitor' >> .cake3/tmp5
	echo 'sql .././demo/Demo2.sql' >> .cake3/tmp5
	echo 'library ../.' >> .cake3/tmp5
	echo '' >> .cake3/tmp5
	echo '$$/list' >> .cake3/tmp5
	echo '$$/char' >> .cake3/tmp5
	echo '$$/string' >> .cake3/tmp5
	echo '.././demo/Demo2' >> .cake3/tmp5
./test2/Stress.exe: .fix-multy5
./test2/Stress.urp: ./Makefile ./lib.urp ./test2/Stress.ur ./test2/Templ.ur .cake3/tmp4
	cat .cake3/tmp4 > ./test2/Stress.urp
.cake3/tmp4: ./Makefile
	-rm -rf .cake3/tmp4
	echo 'debug' >> .cake3/tmp4
	echo 'allow url http://code.jquery.com/ui/1.10.3/jquery-ui.js' >> .cake3/tmp4
	echo 'allow mime text/javascript' >> .cake3/tmp4
	echo 'allow mime text/css' >> .cake3/tmp4
	echo 'allow mime image/jpeg' >> .cake3/tmp4
	echo 'allow mime image/png' >> .cake3/tmp4
	echo 'allow mime image/gif' >> .cake3/tmp4
	echo 'database dbname=Stress' >> .cake3/tmp4
	echo 'safeGet Stress/main' >> .cake3/tmp4
	echo 'safeGet Stress/job_monitor' >> .cake3/tmp4
	echo 'safeGet Stress/src_monitor' >> .cake3/tmp4
	echo 'safeGet Stress/job_start' >> .cake3/tmp4
	echo 'safeGet Stress/finished' >> .cake3/tmp4
	echo 'safeGet Stress/cleanup' >> .cake3/tmp4
	echo 'safeGet Stress/monitor' >> .cake3/tmp4
	echo 'safeGet Stress/run' >> .cake3/tmp4
	echo 'safeGet Stress/C/callback' >> .cake3/tmp4
	echo 'safeGet Stress/cnt' >> .cake3/tmp4
	echo 'safeGet Stress/Find/C/callback' >> .cake3/tmp4
	echo 'safeGet Stress/Cat/C/callback' >> .cake3/tmp4
	echo 'safeGet Stress/viewsrc' >> .cake3/tmp4
	echo 'safeGet Stress/status' >> .cake3/tmp4
	echo 'safeGet Stress/lastline' >> .cake3/tmp4
	echo 'safeGet Stress/longrunning' >> .cake3/tmp4
	echo 'sql .././test2/Stress.sql' >> .cake3/tmp4
	echo 'library ../.' >> .cake3/tmp4
	echo '' >> .cake3/tmp4
	echo '$$/list' >> .cake3/tmp4
	echo '$$/string' >> .cake3/tmp4
	echo '.././test2/Templ' >> .cake3/tmp4
	echo '.././test2/Stress' >> .cake3/tmp4
./test2/Stdout.exe: .fix-multy4
./test2/Stdout.urp: ./Makefile ./lib.urp ./test2/Stdout.ur ./test2/Templ.ur .cake3/tmp3
	cat .cake3/tmp3 > ./test2/Stdout.urp
.cake3/tmp3: ./Makefile
	-rm -rf .cake3/tmp3
	echo 'debug' >> .cake3/tmp3
	echo 'allow url http://code.jquery.com/ui/1.10.3/jquery-ui.js' >> .cake3/tmp3
	echo 'allow mime text/javascript' >> .cake3/tmp3
	echo 'allow mime text/css' >> .cake3/tmp3
	echo 'allow mime image/jpeg' >> .cake3/tmp3
	echo 'allow mime image/png' >> .cake3/tmp3
	echo 'allow mime image/gif' >> .cake3/tmp3
	echo 'database dbname=Stdout' >> .cake3/tmp3
	echo 'safeGet Stdout/main' >> .cake3/tmp3
	echo 'safeGet Stdout/job_monitor' >> .cake3/tmp3
	echo 'safeGet Stdout/src_monitor' >> .cake3/tmp3
	echo 'safeGet Stdout/job_start' >> .cake3/tmp3
	echo 'safeGet Stdout/finished' >> .cake3/tmp3
	echo 'safeGet Stdout/cleanup' >> .cake3/tmp3
	echo 'safeGet Stdout/monitor' >> .cake3/tmp3
	echo 'safeGet Stdout/run' >> .cake3/tmp3
	echo 'safeGet Stdout/C/callback' >> .cake3/tmp3
	echo 'safeGet Stdout/cnt' >> .cake3/tmp3
	echo 'safeGet Stdout/Find/C/callback' >> .cake3/tmp3
	echo 'safeGet Stdout/Cat/C/callback' >> .cake3/tmp3
	echo 'safeGet Stdout/viewsrc' >> .cake3/tmp3
	echo 'safeGet Stdout/status' >> .cake3/tmp3
	echo 'safeGet Stdout/lastline' >> .cake3/tmp3
	echo 'safeGet Stdout/longrunning' >> .cake3/tmp3
	echo 'sql .././test2/Stdout.sql' >> .cake3/tmp3
	echo 'library ../.' >> .cake3/tmp3
	echo '' >> .cake3/tmp3
	echo '$$/list' >> .cake3/tmp3
	echo '$$/string' >> .cake3/tmp3
	echo '.././test2/Templ' >> .cake3/tmp3
	echo '.././test2/Stdout' >> .cake3/tmp3
./test2/Simple1.exe: .fix-multy3
./test2/Simple1.urp: ./Makefile ./lib.urp ./test2/Simple1.ur ./test2/Templ.ur .cake3/tmp2
	cat .cake3/tmp2 > ./test2/Simple1.urp
.cake3/tmp2: ./Makefile
	-rm -rf .cake3/tmp2
	echo 'debug' >> .cake3/tmp2
	echo 'allow url http://code.jquery.com/ui/1.10.3/jquery-ui.js' >> .cake3/tmp2
	echo 'allow mime text/javascript' >> .cake3/tmp2
	echo 'allow mime text/css' >> .cake3/tmp2
	echo 'allow mime image/jpeg' >> .cake3/tmp2
	echo 'allow mime image/png' >> .cake3/tmp2
	echo 'allow mime image/gif' >> .cake3/tmp2
	echo 'database dbname=Simple1' >> .cake3/tmp2
	echo 'safeGet Simple1/main' >> .cake3/tmp2
	echo 'safeGet Simple1/job_monitor' >> .cake3/tmp2
	echo 'safeGet Simple1/src_monitor' >> .cake3/tmp2
	echo 'safeGet Simple1/job_start' >> .cake3/tmp2
	echo 'safeGet Simple1/finished' >> .cake3/tmp2
	echo 'safeGet Simple1/cleanup' >> .cake3/tmp2
	echo 'safeGet Simple1/monitor' >> .cake3/tmp2
	echo 'safeGet Simple1/run' >> .cake3/tmp2
	echo 'safeGet Simple1/C/callback' >> .cake3/tmp2
	echo 'safeGet Simple1/cnt' >> .cake3/tmp2
	echo 'safeGet Simple1/Find/C/callback' >> .cake3/tmp2
	echo 'safeGet Simple1/Cat/C/callback' >> .cake3/tmp2
	echo 'safeGet Simple1/viewsrc' >> .cake3/tmp2
	echo 'safeGet Simple1/status' >> .cake3/tmp2
	echo 'safeGet Simple1/lastline' >> .cake3/tmp2
	echo 'safeGet Simple1/longrunning' >> .cake3/tmp2
	echo 'sql .././test2/Simple1.sql' >> .cake3/tmp2
	echo 'library ../.' >> .cake3/tmp2
	echo '' >> .cake3/tmp2
	echo '$$/list' >> .cake3/tmp2
	echo '$$/string' >> .cake3/tmp2
	echo '.././test2/Templ' >> .cake3/tmp2
	echo '.././test2/Simple1' >> .cake3/tmp2
./test/Stress.exe: .fix-multy2
./test/Stress.urp: ./Makefile ./lib.urp ./test/Stress.ur ./test2/Templ.ur .cake3/tmp1
	cat .cake3/tmp1 > ./test/Stress.urp
.cake3/tmp1: ./Makefile
	-rm -rf .cake3/tmp1
	echo 'debug' >> .cake3/tmp1
	echo 'allow url http://code.jquery.com/ui/1.10.3/jquery-ui.js' >> .cake3/tmp1
	echo 'allow mime text/javascript' >> .cake3/tmp1
	echo 'allow mime text/css' >> .cake3/tmp1
	echo 'allow mime image/jpeg' >> .cake3/tmp1
	echo 'allow mime image/png' >> .cake3/tmp1
	echo 'allow mime image/gif' >> .cake3/tmp1
	echo 'database dbname=Stress' >> .cake3/tmp1
	echo 'safeGet Stress/main' >> .cake3/tmp1
	echo 'safeGet Stress/job_monitor' >> .cake3/tmp1
	echo 'safeGet Stress/src_monitor' >> .cake3/tmp1
	echo 'safeGet Stress/job_start' >> .cake3/tmp1
	echo 'safeGet Stress/finished' >> .cake3/tmp1
	echo 'safeGet Stress/cleanup' >> .cake3/tmp1
	echo 'safeGet Stress/monitor' >> .cake3/tmp1
	echo 'safeGet Stress/run' >> .cake3/tmp1
	echo 'safeGet Stress/C/callback' >> .cake3/tmp1
	echo 'safeGet Stress/cnt' >> .cake3/tmp1
	echo 'safeGet Stress/Find/C/callback' >> .cake3/tmp1
	echo 'safeGet Stress/Cat/C/callback' >> .cake3/tmp1
	echo 'safeGet Stress/viewsrc' >> .cake3/tmp1
	echo 'safeGet Stress/status' >> .cake3/tmp1
	echo 'safeGet Stress/lastline' >> .cake3/tmp1
	echo 'safeGet Stress/longrunning' >> .cake3/tmp1
	echo 'sql .././test/Stress.sql' >> .cake3/tmp1
	echo 'library ../.' >> .cake3/tmp1
	echo '' >> .cake3/tmp1
	echo '$$/list' >> .cake3/tmp1
	echo '$$/string' >> .cake3/tmp1
	echo '.././test2/Templ' >> .cake3/tmp1
	echo '.././test/Stress' >> .cake3/tmp1
./lib.urp: ./Callback.ur ./Callback.urs ./CallbackFFI.h ./CallbackFFI.o ./CallbackNotify.ur ./CallbackNotify.urs ./CallbackNotify2.ur ./CallbackNotify2.urs ./Makefile .cake3/tmp0
	cat .cake3/tmp0 > ./lib.urp
.cake3/tmp0: ./Makefile
	-rm -rf .cake3/tmp0
	echo 'ffi ./CallbackFFI' >> .cake3/tmp0
	echo 'include ./CallbackFFI.h' >> .cake3/tmp0
	echo 'link ./CallbackFFI.o' >> .cake3/tmp0
	echo 'link -lstdc++' >> .cake3/tmp0
	echo 'safeGet Callback/Default/callback' >> .cake3/tmp0
	echo 'safeGet CallbackNotify/C/callback' >> .cake3/tmp0
	echo '' >> .cake3/tmp0
	echo '$$/list' >> .cake3/tmp0
	echo './Callback' >> .cake3/tmp0
	echo './CallbackNotify' >> .cake3/tmp0
	echo './CallbackNotify2' >> .cake3/tmp0
./CallbackFFI.o: ./CallbackFFI.cpp ./Makefile $(call GUARD,URCPP) $(call GUARD,URINCL) $(call GUARD,UR_CFLAGS)
	$(URCPP) -c $(UR_CFLAGS) $(URINCL) -std=c++11 -o ./CallbackFFI.o ./CallbackFFI.cpp
./demo/Demo2.sql: .fix-multy1
./test/Stress.sql: .fix-multy2
./test2/Simple1.sql: .fix-multy3
./test2/Stdout.sql: .fix-multy4
./test2/Stress.sql: .fix-multy5
.INTERMEDIATE: .fix-multy1
.fix-multy1: ./Makefile ./demo/Demo2.urp $(call GUARD,URVERSION)
	urweb -dbms postgres ./demo/Demo2
.INTERMEDIATE: .fix-multy2
.fix-multy2: ./Makefile ./test/Stress.urp $(call GUARD,URVERSION)
	urweb -dbms postgres ./test/Stress
.INTERMEDIATE: .fix-multy3
.fix-multy3: ./Makefile ./test2/Simple1.urp $(call GUARD,URVERSION)
	urweb -dbms postgres ./test2/Simple1
.INTERMEDIATE: .fix-multy4
.fix-multy4: ./Makefile ./test2/Stdout.urp $(call GUARD,URVERSION)
	urweb -dbms postgres ./test2/Stdout
.INTERMEDIATE: .fix-multy5
.fix-multy5: ./Makefile ./test2/Stress.urp $(call GUARD,URVERSION)
	urweb -dbms postgres ./test2/Stress
$(call GUARD,URCPP):
	rm -f .cake3/GUARD_URCPP_*
	touch $@
$(call GUARD,URINCL):
	rm -f .cake3/GUARD_URINCL_*
	touch $@
$(call GUARD,URVERSION):
	rm -f .cake3/GUARD_URVERSION_*
	touch $@
$(call GUARD,UR_CFLAGS):
	rm -f .cake3/GUARD_UR_CFLAGS_*
	touch $@

else

# Prebuild/postbuild section

export MAIN=1

ifneq ($(MAKECMDGOALS),clean)

.PHONY: all
all: .fix-multy1
.PHONY: ./demo/Demo2.db
./demo/Demo2.db: .fix-multy1
.PHONY: ./test2/Stress.db
./test2/Stress.db: .fix-multy1
.PHONY: ./test2/Stdout.db
./test2/Stdout.db: .fix-multy1
.PHONY: ./test2/Simple1.db
./test2/Simple1.db: .fix-multy1
.PHONY: ./test/Stress.db
./test/Stress.db: .fix-multy1
.PHONY: lib
lib: .fix-multy1
.PHONY: demo
demo: .fix-multy1
.PHONY: ./demo/Demo2.exe
./demo/Demo2.exe: .fix-multy1
.PHONY: ./demo/Demo2.urp
./demo/Demo2.urp: .fix-multy1
.PHONY: .cake3/tmp5
.cake3/tmp5: .fix-multy1
.PHONY: ./test2/Stress.exe
./test2/Stress.exe: .fix-multy1
.PHONY: ./test2/Stress.urp
./test2/Stress.urp: .fix-multy1
.PHONY: .cake3/tmp4
.cake3/tmp4: .fix-multy1
.PHONY: ./test2/Stdout.exe
./test2/Stdout.exe: .fix-multy1
.PHONY: ./test2/Stdout.urp
./test2/Stdout.urp: .fix-multy1
.PHONY: .cake3/tmp3
.cake3/tmp3: .fix-multy1
.PHONY: ./test2/Simple1.exe
./test2/Simple1.exe: .fix-multy1
.PHONY: ./test2/Simple1.urp
./test2/Simple1.urp: .fix-multy1
.PHONY: .cake3/tmp2
.cake3/tmp2: .fix-multy1
.PHONY: ./test/Stress.exe
./test/Stress.exe: .fix-multy1
.PHONY: ./test/Stress.urp
./test/Stress.urp: .fix-multy1
.PHONY: .cake3/tmp1
.cake3/tmp1: .fix-multy1
.PHONY: ./lib.urp
./lib.urp: .fix-multy1
.PHONY: .cake3/tmp0
.cake3/tmp0: .fix-multy1
.PHONY: ./CallbackFFI.o
./CallbackFFI.o: .fix-multy1
.PHONY: ./demo/Demo2.sql
./demo/Demo2.sql: .fix-multy1
.PHONY: ./test/Stress.sql
./test/Stress.sql: .fix-multy1
.PHONY: ./test2/Simple1.sql
./test2/Simple1.sql: .fix-multy1
.PHONY: ./test2/Stdout.sql
./test2/Stdout.sql: .fix-multy1
.PHONY: ./test2/Stress.sql
./test2/Stress.sql: .fix-multy1
.INTERMEDIATE: .fix-multy1
.fix-multy1: 
	-mkdir .cake3
	$(MAKE) -f ./Makefile $(MAKECMDGOALS)

endif
.PHONY: clean
clean: 
	-rm ./CallbackFFI.o ./demo/Demo2.db ./demo/Demo2.exe ./demo/Demo2.sql ./demo/Demo2.urp ./lib.urp ./test/Stress.db ./test/Stress.exe ./test/Stress.sql ./test/Stress.urp ./test2/Simple1.db ./test2/Simple1.exe ./test2/Simple1.sql ./test2/Simple1.urp ./test2/Stdout.db ./test2/Stdout.exe ./test2/Stdout.sql ./test2/Stdout.urp ./test2/Stress.db ./test2/Stress.exe ./test2/Stress.sql ./test2/Stress.urp .cake3/tmp0 .cake3/tmp1 .cake3/tmp2 .cake3/tmp3 .cake3/tmp4 .cake3/tmp5
	-rm -rf .cake3

endif
