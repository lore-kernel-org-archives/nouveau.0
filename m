From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 50121] [Regression] Since kernel v3.5 several cards
 fail to resume, introduced by: 'convert to exec engine,
 and improve channel sync'
Date: Tue, 30 Apr 2013 00:48:59 +0000
Message-ID: <bug-50121-8800-IVqEe4Yybt@http.bugs.freedesktop.org/>
References: <bug-50121-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0488027863=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-50121-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0488027863==
Content-Type: multipart/alternative; boundary="1367282939.d125fAE4.23013"; charset="us-ascii"


--1367282939.d125fAE4.23013
Date: Tue, 30 Apr 2013 00:48:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=50121

--- Comment #72 from Mr-4 <mr.dash.four-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> ---
Things have been pretty stable with 3.8.1, but it is getting a bit "twitchy"
with 3.8.7 - on two separate occasions I've got the following error on restore:

kernel: nouveau  [     DRM] re-enabling device...
kernel: nouveau  [     DRM] resuming client object trees...
kernel: nouveau  [   VBIOS][0000:01:00.0] running init tables
kernel: nouveau  [     DRM] resuming display...
kernel: nouveau W[   PFIFO][0000:01:00.0] unknown intr 0x00010000, ch 0
kernel: nouveau W[   PFIFO][0000:01:00.0] unknown intr 0x00010000, ch 0
kernel: nouveau W[   PFIFO][0000:01:00.0] unknown intr 0x00010000, ch 0
[...]
kernel: nouveau E[   PFIFO][0000:01:00.0] still angry after 101 spins, halt
kernel: nouveau  [     DRM] 0xD3FB: Parsing digital output script table
kernel: nouveau  [     DRM] Setting dpms mode 3 on TV encoder (output 3)
kernel: nouveau  [     DRM] 0xD3FB: Parsing digital output script table


at which point the whole screen starts with the now-familiar black-and-white
rectangles and I have no option, but to reboot.

The above error does not happen very often - maybe every 8-10 hibernate/resume
cycles, but with the 3.8.1. kernel I didn't have any errors at all.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1367282939.d125fAE4.23013
Date: Tue, 30 Apr 2013 00:48:59 +0000
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
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [Regression] Since kernel v3.5 several cards fail to resume, introduced by: 'convert to exec engine, and improve channel sync'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=50121#c72">Comment # 72</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [Regression] Since kernel v3.5 several cards fail to resume, introduced by: 'convert to exec engine, and improve channel sync'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=50121">bug 50121</a>
              from <span class="vcard"><a class="email" href="mailto:mr.dash.four&#64;googlemail.com" title="Mr-4 &lt;mr.dash.four&#64;googlemail.com&gt;"> <span class="fn">Mr-4</span></a>
</span></b>
        <pre>Things have been pretty stable with 3.8.1, but it is getting a bit &quot;twitchy&quot;
with 3.8.7 - on two separate occasions I've got the following error on restore:

kernel: nouveau  [     DRM] re-enabling device...
kernel: nouveau  [     DRM] resuming client object trees...
kernel: nouveau  [   VBIOS][0000:01:00.0] running init tables
kernel: nouveau  [     DRM] resuming display...
kernel: nouveau W[   PFIFO][0000:01:00.0] unknown intr 0x00010000, ch 0
kernel: nouveau W[   PFIFO][0000:01:00.0] unknown intr 0x00010000, ch 0
kernel: nouveau W[   PFIFO][0000:01:00.0] unknown intr 0x00010000, ch 0
[...]
kernel: nouveau E[   PFIFO][0000:01:00.0] still angry after 101 spins, halt
kernel: nouveau  [     DRM] 0xD3FB: Parsing digital output script table
kernel: nouveau  [     DRM] Setting dpms mode 3 on TV encoder (output 3)
kernel: nouveau  [     DRM] 0xD3FB: Parsing digital output script table


at which point the whole screen starts with the now-familiar black-and-white
rectangles and I have no option, but to reboot.

The above error does not happen very often - maybe every 8-10 hibernate/resume
cycles, but with the 3.8.1. kernel I didn't have any errors at all.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1367282939.d125fAE4.23013--

--===============0488027863==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0488027863==--
