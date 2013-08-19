From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 42479] piglit/glean/readPixSanity fails - dmesg
 PGRAPH - TRAP_TPDMA - TP0: Unhandled ustatus 0x00020000
Date: Mon, 19 Aug 2013 06:53:31 +0000
Message-ID: <bug-42479-8800-0iN79tAznc@http.bugs.freedesktop.org/>
References: <bug-42479-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0890982219=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-42479-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0890982219==
Content-Type: multipart/alternative; boundary="1376895211.BEBB21.24101"; charset="us-ascii"


--1376895211.BEBB21.24101
Date: Mon, 19 Aug 2013 06:53:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=42479

dirkneukirchen-S0/GAf8tV78@public.gmane.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|INVALID                     |FIXED

--- Comment #5 from dirkneukirchen-S0/GAf8tV78@public.gmane.org ---
nouveau passes this test now

Linux 3.11-rc5 and
Linux 3.8.0-27-generic (Ubuntu kernel)
with current xorg-edgers of 20130729 (mesa ...) 20130702 (libdrm-nouveau) etc.

Hardware was:
Chipset: MCP77/MCP78 (NVAA)
Family : NV50

 piglit-run.py /usr/share/piglit/tests/sanity.tests results/sanity.results 
[Mon Aug 19 06:52:29 2013] ::  running :: glean/readPixSanity
[Mon Aug 19 06:56:10 2013] ::     pass :: glean/readPixSanity
[Mon Aug 19 06:56:10 2013] ::  running :: glean/basic
[Mon Aug 19 06:56:12 2013] ::     pass :: glean/basic

nouveau.debug=debug and dmesg has entries:
[342440.398336] nouveau D[  DEVICE][0000:02:00.0][0x80000080][f23fd840] illegal
class 0xa06f
[342440.398340] nouveau D[  DEVICE][0000:02:00.0][0x80000080][f23fd840] illegal
class 0x906f

I don't know if that is important.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1376895211.BEBB21.24101
Date: Mon, 19 Aug 2013 06:53:31 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:dirkneukirchen&#64;web.de" title="dirkneukirchen&#64;web.de">dirkneukirchen&#64;web.de</a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - piglit/glean/readPixSanity fails - dmesg PGRAPH - TRAP_TPDMA - TP0: Unhandled ustatus 0x00020000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=42479">bug 42479</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>INVALID
           </td>
           <td>FIXED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - piglit/glean/readPixSanity fails - dmesg PGRAPH - TRAP_TPDMA - TP0: Unhandled ustatus 0x00020000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=42479#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - piglit/glean/readPixSanity fails - dmesg PGRAPH - TRAP_TPDMA - TP0: Unhandled ustatus 0x00020000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=42479">bug 42479</a>
              from <span class="vcard"><a class="email" href="mailto:dirkneukirchen&#64;web.de" title="dirkneukirchen&#64;web.de">dirkneukirchen&#64;web.de</a>
</span></b>
        <pre>nouveau passes this test now

Linux 3.11-rc5 and
Linux 3.8.0-27-generic (Ubuntu kernel)
with current xorg-edgers of 20130729 (mesa ...) 20130702 (libdrm-nouveau) etc.

Hardware was:
Chipset: MCP77/MCP78 (NVAA)
Family : NV50

 piglit-run.py /usr/share/piglit/tests/sanity.tests results/sanity.results 
[Mon Aug 19 06:52:29 2013] ::  running :: glean/readPixSanity
[Mon Aug 19 06:56:10 2013] ::     pass :: glean/readPixSanity
[Mon Aug 19 06:56:10 2013] ::  running :: glean/basic
[Mon Aug 19 06:56:12 2013] ::     pass :: glean/basic

nouveau.debug=debug and dmesg has entries:
[342440.398336] nouveau D[  DEVICE][0000:02:00.0][0x80000080][f23fd840] illegal
class 0xa06f
[342440.398340] nouveau D[  DEVICE][0000:02:00.0][0x80000080][f23fd840] illegal
class 0x906f

I don't know if that is important.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1376895211.BEBB21.24101--

--===============0890982219==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0890982219==--
