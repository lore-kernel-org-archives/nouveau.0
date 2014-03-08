From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75813] [NV40] X hangs, system unresponsive
Date: Sat, 08 Mar 2014 19:36:43 +0000
Message-ID: <bug-75813-8800-YY1PTLQtWt@http.bugs.freedesktop.org/>
References: <bug-75813-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0490512391=="
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


--===============0490512391==
Content-Type: multipart/alternative; boundary="1394307403.6afb51.1237"; charset="us-ascii"


--1394307403.6afb51.1237
Date: Sat, 8 Mar 2014 19:36:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75813

--- Comment #3 from Marco van Hulten <marco-OrqDK/dsKCwdnm+yROfE0A@public.gmane.org> ---
Forget most of my previous message.  It now appears to be the case that I have
crashes in combination with certain kernel:

3.2.0-3-amd64    CRASH
3.7-trunk-amd64  no problem
3.12-1-amd64     CRASH
3.13-1-amd64     CRASH

As soon as I have an Xorg log with the error, I will post it here.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1394307403.6afb51.1237
Date: Sat, 8 Mar 2014 19:36:43 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75813#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV40] X hangs, system unresponsive"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75813">bug 75813</a>
              from <span class="vcard"><a class="email" href="mailto:marco&#64;hulten.org" title="Marco van Hulten &lt;marco&#64;hulten.org&gt;"> <span class="fn">Marco van Hulten</span></a>
</span></b>
        <pre>Forget most of my previous message.  It now appears to be the case that I have
crashes in combination with certain kernel:

3.2.0-3-amd64    CRASH
3.7-trunk-amd64  no problem
3.12-1-amd64     CRASH
3.13-1-amd64     CRASH

As soon as I have an Xorg log with the error, I will post it here.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1394307403.6afb51.1237--

--===============0490512391==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0490512391==--
