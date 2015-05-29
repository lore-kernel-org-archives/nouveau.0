From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89730] NV50: LightDM GTK+ Greeter Background -
 inconsistent display
Date: Fri, 29 May 2015 02:07:14 +0000
Message-ID: <bug-89730-8800-j77DYsRerv@http.bugs.freedesktop.org/>
References: <bug-89730-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0849168209=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89730-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0849168209==
Content-Type: multipart/alternative; boundary="1432865234.446DEd001.14557"; charset="UTF-8"


--1432865234.446DEd001.14557
Date: Fri, 29 May 2015 02:07:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89730

--- Comment #30 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---

# which xtrace
/bin/xtrace


# rpm -qf /bin/xtrace
glibc-utils-2.20-8.fc21.x86_64


# yum -q search xtrace
============================= N/S matched: xtrace
==============================
xtrace.x86_64 : A program for X11 protocol tracing


# yum -q install xtrace

================================================================================
 Package         Arch            Version                  Repository       Size
================================================================================
Installing:
 xtrace          x86_64          1.3.1-7.fc21             fedora          102 k

Transaction Summary
================================================================================
Install  1 Package

Is this ok [y/d/N]: y


Transaction check error:
  file /usr/bin/xtrace from install of xtrace-1.3.1-7.fc21.x86_64 conflicts
with file from package glibc-utils-2.20-8.fc21.x86_64

Error Summary
-------------


# yumdownloader -q xtrace


# rpm -ivh xtrace-1.3.1-7.fc21.x86_64.rpm 
Preparing...                          ################################# [100%]
    file /usr/bin/xtrace from install of xtrace-1.3.1-7.fc21.x86_64 conflicts
with file from package glibc-utils-2.20-8.fc21.x86_64



# rpm -ivh xtrace-1.3.1-7.fc21.x86_64.rpm --force
Preparing...                          ################################# [100%]
Updating / installing...
   1:xtrace-1.3.1-7.fc21              ################################# [100%]


# rpm -qf /bin/xtrace
xtrace-1.3.1-7.fc21.x86_64


# xtrace --help
xtrace: Dump all X protocol data being tunneled from a fake X display to a real
one.
usage: xtrace [options] [[--] command args ...]
--display, -d <display to connect to>
--fakedisplay, -D <display to fake>
--copyauthentication, -c    Copy credentials
--nocopyauthentication, -n    Do not copy credentials
--authfile, -f <file instead of ~/.Xauthority to get credentials from>
--newauthfile, -F <file instead of ~/.Xauthority to put credentials in>
--waitforclient, -W        wait for connection even if command terminates
--stopwhendone, -s        Return when last client disconnects
--keeprunning, -k        Keep running
--denyextensions, -e        Fake unavailability of all extensions
--readwritedebug, -w        Print amounts of data read/sent
--maxlistlength, -m <maximum number of entries in each list shown>
--outfile, -o <filename>    Output to file instead of stdout
--buffered, -b            Do not output every line but only when buffer is full


# xtrace --version
xtrace version 1.3.1

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1432865234.446DEd001.14557
Date: Fri, 29 May 2015 02:07:14 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - NV50: LightDM GTK+ Greeter Background - inconsistent display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89730#c30">Comment # 30</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - NV50: LightDM GTK+ Greeter Background - inconsistent display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89730">bug 89730</a>
              from <span class="vcard"><a class="email" href="mailto:pomidorabelisima&#64;gmail.com" title="poma &lt;pomidorabelisima&#64;gmail.com&gt;"> <span class="fn">poma</span></a>
</span></b>
        <pre>
# which xtrace
/bin/xtrace


# rpm -qf /bin/xtrace
glibc-utils-2.20-8.fc21.x86_64


# yum -q search xtrace
============================= N/S matched: xtrace
==============================
xtrace.x86_64 : A program for X11 protocol tracing


# yum -q install xtrace

================================================================================
 Package         Arch            Version                  Repository       Size
================================================================================
Installing:
 xtrace          x86_64          1.3.1-7.fc21             fedora          102 k

Transaction Summary
================================================================================
Install  1 Package

Is this ok [y/d/N]: y


Transaction check error:
  file /usr/bin/xtrace from install of xtrace-1.3.1-7.fc21.x86_64 conflicts
with file from package glibc-utils-2.20-8.fc21.x86_64

Error Summary
-------------


# yumdownloader -q xtrace


# rpm -ivh xtrace-1.3.1-7.fc21.x86_64.rpm 
Preparing...                          ################################# [100%]
    file /usr/bin/xtrace from install of xtrace-1.3.1-7.fc21.x86_64 conflicts
with file from package glibc-utils-2.20-8.fc21.x86_64



# rpm -ivh xtrace-1.3.1-7.fc21.x86_64.rpm --force
Preparing...                          ################################# [100%]
Updating / installing...
   1:xtrace-1.3.1-7.fc21              ################################# [100%]


# rpm -qf /bin/xtrace
xtrace-1.3.1-7.fc21.x86_64


# xtrace --help
xtrace: Dump all X protocol data being tunneled from a fake X display to a real
one.
usage: xtrace [options] [[--] command args ...]
--display, -d &lt;display to connect to&gt;
--fakedisplay, -D &lt;display to fake&gt;
--copyauthentication, -c    Copy credentials
--nocopyauthentication, -n    Do not copy credentials
--authfile, -f &lt;file instead of ~/.Xauthority to get credentials from&gt;
--newauthfile, -F &lt;file instead of ~/.Xauthority to put credentials in&gt;
--waitforclient, -W        wait for connection even if command terminates
--stopwhendone, -s        Return when last client disconnects
--keeprunning, -k        Keep running
--denyextensions, -e        Fake unavailability of all extensions
--readwritedebug, -w        Print amounts of data read/sent
--maxlistlength, -m &lt;maximum number of entries in each list shown&gt;
--outfile, -o &lt;filename&gt;    Output to file instead of stdout
--buffered, -b            Do not output every line but only when buffer is full


# xtrace --version
xtrace version 1.3.1</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1432865234.446DEd001.14557--

--===============0849168209==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0849168209==--
