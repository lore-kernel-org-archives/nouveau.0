From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75813] [NV40] X hangs, system unresponsive
Date: Sat, 08 Mar 2014 19:13:26 +0000
Message-ID: <bug-75813-8800-Yqv68n4UgE@http.bugs.freedesktop.org/>
References: <bug-75813-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0157178130=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75813-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0157178130==
Content-Type: multipart/alternative; boundary="1394306006.2d8F1f1.30712"; charset="us-ascii"


--1394306006.2d8F1f1.30712
Date: Sat, 8 Mar 2014 19:13:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75813

--- Comment #2 from Marco van Hulten <marco-OrqDK/dsKCwdnm+yROfE0A@public.gmane.org> ---
I am afraid that I have not saved the Xorg log with these messages (of the
crash).  Moreover, I have not experienced crashes since my bug report.

I had not installed libvdpau_nouveau.so, but I did have libvdpau.so as a
dependency of the mplayer2 package.  Is this the same thing?  I removed it and
after that reinstalled it.  Possibly the library is different from before,
since before I used the debian-multimedia repository which may have contained
this library, but not anymore since that repo has become obsolete for Debian.

I will report again when the problem returns.  If I will not report within two
weeks or so, we should close this bug report.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1394306006.2d8F1f1.30712
Date: Sat, 8 Mar 2014 19:13:26 +0000
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
   title="NEW --- - [NV40] X hangs, system unresponsive"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75813#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV40] X hangs, system unresponsive"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75813">bug 75813</a>
              from <span class="vcard"><a class="email" href="mailto:marco&#64;hulten.org" title="Marco van Hulten &lt;marco&#64;hulten.org&gt;"> <span class="fn">Marco van Hulten</span></a>
</span></b>
        <pre>I am afraid that I have not saved the Xorg log with these messages (of the
crash).  Moreover, I have not experienced crashes since my bug report.

I had not installed libvdpau_nouveau.so, but I did have libvdpau.so as a
dependency of the mplayer2 package.  Is this the same thing?  I removed it and
after that reinstalled it.  Possibly the library is different from before,
since before I used the debian-multimedia repository which may have contained
this library, but not anymore since that repo has become obsolete for Debian.

I will report again when the problem returns.  If I will not report within two
weeks or so, we should close this bug report.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1394306006.2d8F1f1.30712--

--===============0157178130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0157178130==--
