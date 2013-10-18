From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70388] [NV34] failed to idle channel 0xcccc0000
Date: Fri, 18 Oct 2013 19:57:28 +0000
Message-ID: <bug-70388-8800-Uap3VJ5X3l@http.bugs.freedesktop.org/>
References: <bug-70388-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1706128400=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70388-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1706128400==
Content-Type: multipart/alternative; boundary="1382126248.5a21a0.7709"; charset="us-ascii"


--1382126248.5a21a0.7709
Date: Fri, 18 Oct 2013 19:57:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70388

--- Comment #13 from Rostislav Krasny <rosti.bsd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #12)

After several backtraces like in the previous comment there is the following
one:

(EE)
[mi] Increasing EQ size to 1024 to prevent dropped events.
[mi] EQ processing has resumed after 433 dropped events.
[mi] This may be caused my a misbehaving driver monopolizing the server's
resources.
(II) AIGLX: Suspending AIGLX clients for VT switch
(EE)
(EE) Backtrace:
(EE) 0: /usr/bin/X (OsLookupColor+0x136) [0x80b6a56]
(EE) 1: ? (?+0x136) [0xb77bd541]
(EE) 2: /lib/libc.so.6 (__GI_memcpy+0x46) [0xb72e34a6]
(EE) 3: ? (?+0x46) [0x9e76e3e]
(EE)
(EE) Segmentation fault at address 0x0
(EE)
Fatal server error:
(EE) Caught signal 11 (Segmentation fault). Server aborting
(EE)
(EE)
Please consult the Fedora Project support
         at http://wiki.x.org
 for help.
(EE) Please also check the log file at "/var/log/Xorg.0.log" for additional
information.
(EE)
(EE) Server terminated with error (1). Closing log file.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1382126248.5a21a0.7709
Date: Fri, 18 Oct 2013 19:57:28 +0000
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
   title="NEW --- - [NV34] failed to idle channel 0xcccc0000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70388#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV34] failed to idle channel 0xcccc0000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70388">bug 70388</a>
              from <span class="vcard"><a class="email" href="mailto:rosti.bsd&#64;gmail.com" title="Rostislav Krasny &lt;rosti.bsd&#64;gmail.com&gt;"> <span class="fn">Rostislav Krasny</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=70388#c12">comment #12</a>)

After several backtraces like in the previous comment there is the following
one:

(EE)
[mi] Increasing EQ size to 1024 to prevent dropped events.
[mi] EQ processing has resumed after 433 dropped events.
[mi] This may be caused my a misbehaving driver monopolizing the server's
resources.
(II) AIGLX: Suspending AIGLX clients for VT switch
(EE)
(EE) Backtrace:
(EE) 0: /usr/bin/X (OsLookupColor+0x136) [0x80b6a56]
(EE) 1: ? (?+0x136) [0xb77bd541]
(EE) 2: /lib/libc.so.6 (__GI_memcpy+0x46) [0xb72e34a6]
(EE) 3: ? (?+0x46) [0x9e76e3e]
(EE)
(EE) Segmentation fault at address 0x0
(EE)
Fatal server error:
(EE) Caught signal 11 (Segmentation fault). Server aborting
(EE)
(EE)
Please consult the Fedora Project support
         at <a href="http://wiki.x.org">http://wiki.x.org</a>
 for help.
(EE) Please also check the log file at &quot;/var/log/Xorg.0.log&quot; for additional
information.
(EE)
(EE) Server terminated with error (1). Closing log file.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1382126248.5a21a0.7709--

--===============1706128400==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1706128400==--
