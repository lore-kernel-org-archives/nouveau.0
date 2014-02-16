From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74648] [NV86] Ultima IX (wine) movie playback
	crashes game
Date: Sun, 16 Feb 2014 00:57:53 +0000
Message-ID: <bug-74648-8800-GKF3FFgcv4@http.bugs.freedesktop.org/>
References: <bug-74648-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1617975080=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74648-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1617975080==
Content-Type: multipart/alternative; boundary="1392512273.A5142.24397"; charset="us-ascii"


--1392512273.A5142.24397
Date: Sun, 16 Feb 2014 00:57:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74648

--- Comment #5 from Christopher Thielen <christopher-XP3JB3hj9piIwRZHo2/mJg@public.gmane.org> ---
Getting closer ...

With "./configure --enable-32-bit --enable-debug CFLAGS="-m32" CXXFLAGS="-m32"
LDFLAGS="-m32"" I now get as far as:

  CC       eglscreen.lo
  CC       eglstring.lo
  CC       eglsurface.lo
  CC       eglsync.lo
  CCLD     libEGL.la
/bin/ld: skipping incompatible /usr/lib64/libudev.so when searching for -ludev
/bin/ld: cannot find -ludev
collect2: error: ld returned 1 exit status
gmake[3]: *** [libEGL.la] Error 1
gmake[3]: Leaving directory `/usr/local/src/Mesa-9.2.5/src/egl/main'
gmake[2]: *** [all-recursive] Error 1
gmake[2]: Leaving directory `/usr/local/src/Mesa-9.2.5/src/egl'
gmake[1]: *** [all-recursive] Error 1
gmake[1]: Leaving directory `/usr/local/src/Mesa-9.2.5/src'
gmake: *** [all-recursive] Error 1

I'm not sure why it can't find udev:

$ rpm -qa | grep -i udev
system-config-printer-udev-1.4.3-2.fc20.x86_64
libgudev1-208-9.fc20.x86_64
libgudev1-208-9.fc20.i686
libgudev1-devel-208-9.fc20.x86_64
libgudev1-devel-208-9.fc20.i686

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392512273.A5142.24397
Date: Sun, 16 Feb 2014 00:57:53 +0000
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
   title="NEW --- - [NV86] Ultima IX (wine) movie playback crashes game"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74648#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Ultima IX (wine) movie playback crashes game"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74648">bug 74648</a>
              from <span class="vcard"><a class="email" href="mailto:christopher&#64;thielen.co" title="Christopher Thielen &lt;christopher&#64;thielen.co&gt;"> <span class="fn">Christopher Thielen</span></a>
</span></b>
        <pre>Getting closer ...

With &quot;./configure --enable-32-bit --enable-debug CFLAGS=&quot;-m32&quot; CXXFLAGS=&quot;-m32&quot;
LDFLAGS=&quot;-m32&quot;&quot; I now get as far as:

  CC       eglscreen.lo
  CC       eglstring.lo
  CC       eglsurface.lo
  CC       eglsync.lo
  CCLD     libEGL.la
/bin/ld: skipping incompatible /usr/lib64/libudev.so when searching for -ludev
/bin/ld: cannot find -ludev
collect2: error: ld returned 1 exit status
gmake[3]: *** [libEGL.la] Error 1
gmake[3]: Leaving directory `/usr/local/src/Mesa-9.2.5/src/egl/main'
gmake[2]: *** [all-recursive] Error 1
gmake[2]: Leaving directory `/usr/local/src/Mesa-9.2.5/src/egl'
gmake[1]: *** [all-recursive] Error 1
gmake[1]: Leaving directory `/usr/local/src/Mesa-9.2.5/src'
gmake: *** [all-recursive] Error 1

I'm not sure why it can't find udev:

$ rpm -qa | grep -i udev
system-config-printer-udev-1.4.3-2.fc20.x86_64
libgudev1-208-9.fc20.x86_64
libgudev1-208-9.fc20.i686
libgudev1-devel-208-9.fc20.x86_64
libgudev1-devel-208-9.fc20.i686</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392512273.A5142.24397--

--===============1617975080==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1617975080==--
