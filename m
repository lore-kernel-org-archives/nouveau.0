From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72315] New: Fedora 19 64-bit X crash
Date: Wed, 04 Dec 2013 14:56:46 +0000
Message-ID: <bug-72315-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1614975727=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============1614975727==
Content-Type: multipart/alternative; boundary="1386169006.6cFD7ECa1.8704"; charset="us-ascii"


--1386169006.6cFD7ECa1.8704
Date: Wed, 4 Dec 2013 14:56:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=72315

          Priority: medium
            Bug ID: 72315
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Fedora 19 64-bit X crash
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: bryan.coleman-SAIwBcqG6t4@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

I am running Fedora 19 kernel 3.11.9-200.fc19.x86_64.  My X session went blank
and a console window started spewing the following messages.  Restarted the
system and all is well now.

xorg-x11-server 1.14.4-3.fc19

dmesg:
[434020.166070] nouveau E[   PIBUS][0000:03:00.0] GPC0: 0x505014 0x00000004
(0x04000200)
[477412.197564] nouveau E[   PIBUS][0000:03:00.0] GPC0: 0x505014 0x00000004
(0x04000200)
[544227.607544] nouveau E[   PIBUS][0000:03:00.0] GPC0: 0x505014 0x00000004
(0x04000200)
[681684.974381] nouveau E[   PFIFO][0000:03:00.0] PFIFO: write fault at
0x00002a0000 [PAGE_NOT_PRESENT] from (unknown enum 0x00000000)/GPC0/(unknown
enum 0x0000000f) on channel 0x007f96f000 [unknown]
[681691.606820] nouveau E[  PGRAPH][0000:03:00.0] TRAP ch 2 [0x007f96f000
X[1473]]
[681691.606833] nouveau E[  PGRAPH][0000:03:00.0] ROP0 0x80000000 0x80000001
[681691.606839] nouveau E[  PGRAPH][0000:03:00.0] ROP1 0x80000000 0x80000001
[681704.871500] nouveau E[  PGRAPH][0000:03:00.0] TRAP ch 2 [0x007f96f000
X[1473]]
[681704.871512] nouveau E[  PGRAPH][0000:03:00.0] ROP0 0x80000000 0x80000001
[681704.871518] nouveau E[  PGRAPH][0000:03:00.0] ROP1 0x80000000 0x80000001
[681707.939524] nouveau E[     DRM] GPU lockup - switching to software fbcon
[681718.136111] nouveau E[  PGRAPH][0000:03:00.0] TRAP ch 2 [0x007f96f000
X[1473]]
[681718.136144] nouveau E[  PGRAPH][0000:03:00.0] ROP0 0x80000000 0x80000001
[681718.136166] nouveau E[  PGRAPH][0000:03:00.0] ROP1 0x80000000 0x80000001
[681723.678476] nouveau E[ X[1473]] failed to idle channel 0xcccc0001 [X[1473]]
[681731.400803] nouveau E[  PGRAPH][0000:03:00.0] TRAP ch 2 [0x007f96f000
X[1473]]
[681731.400833] nouveau E[  PGRAPH][0000:03:00.0] ROP0 0x80000000 0x80000001
[681731.400855] nouveau E[  PGRAPH][0000:03:00.0] ROP1 0x80000000 0x80000001
[681738.689165] nouveau E[ X[1473]] failed to idle channel 0xcccc0001 [X[1473]]
[681740.693295] nouveau E[   PFIFO][0000:03:00.0] playlist 0 update timeout
[681742.989755] nouveau W[   PFIFO][0000:03:00.0] unknown status 0x00000100
[681744.665484] nouveau E[  PGRAPH][0000:03:00.0] TRAP ch 2 [0x007f96f000
X[1473]]
[681744.665516] nouveau E[  PGRAPH][0000:03:00.0] ROP0 0x80000000 0x80000001
[681744.665538] nouveau E[  PGRAPH][0000:03:00.0] ROP1 0x80000000 0x80000001
[681747.287525] nouveau W[   PFIFO][0000:03:00.0] unknown status 0x00000100
[681751.585296] nouveau W[   PFIFO][0000:03:00.0] unknown status 0x00000100
[681755.704304] nouveau E[ X[1473]] failed to idle channel 0xcccc0000 [X[1473]]
[681755.883068] nouveau W[   PFIFO][0000:03:00.0] unknown status 0x00000100
[681757.930171] nouveau E[  PGRAPH][0000:03:00.0] TRAP ch 2 [0x007f96f000
X[1473]]
[681757.930200] nouveau E[  PGRAPH][0000:03:00.0] ROP0 0x80000000 0x80000001
[681757.930222] nouveau E[  PGRAPH][0000:03:00.0] ROP1 0x80000000 0x80000001
[681760.180832] nouveau W[   PFIFO][0000:03:00.0] unknown status 0x00000100
[681764.478598] nouveau W[   PFIFO][0000:03:00.0] unknown status 0x00000100
[681768.776363] nouveau W[   PFIFO][0000:03:00.0] unknown status 0x00000100
[681770.714985] nouveau E[ X[1473]] failed to idle channel 0xcccc0000 [X[1473]]
[681771.194848] nouveau E[  PGRAPH][0000:03:00.0] TRAP ch 2 [0x007f96f000
X[1473]]
[681771.194877] nouveau E[  PGRAPH][0000:03:00.0] ROP0 0x80000000 0x80000001
[681771.194899] nouveau E[  PGRAPH][0000:03:00.0] ROP1 0x80000000 0x80000001
[681772.716434] nouveau E[   PFIFO][0000:03:00.0] channel 2 [X[1473]] kick
timeout
[681772.716924] nouveau W[   PFIFO][0000:03:00.0] unknown status 0x00000100
[681774.718239] nouveau E[   PFIFO][0000:03:00.0] channel 2 [X[1473]] kick
timeout
[681774.720867] nouveau W[   PFIFO][0000:03:00.0] unknown status 0x00000100
[681776.722174] nouveau E[   PFIFO][0000:03:00.0] playlist 0 update timeout
[681776.722197] nouveau ![   PFIFO][0000:03:00.0] unhandled status 0x00000001
[681780.482484] nouveau E[   PFIFO][0000:03:00.0] playlist 0 update timeout
[681782.497932] nouveau E[   PFIFO][0000:03:00.0] playlist 0 update timeout
[681784.459542] nouveau E[  PGRAPH][0000:03:00.0] TRAP ch 2 [0x007f96f000
X[12349]]
[681784.459551] nouveau E[  PGRAPH][0000:03:00.0] ROP0 0x80000000 0x80000001
[681784.459555] nouveau E[  PGRAPH][0000:03:00.0] ROP1 0x80000000 0x80000001
[681792.850755] nouveau E[kwin[1835]] failed to idle channel 0xcccc0000
[kwin[1835]]
[681797.724232] nouveau E[  PGRAPH][0000:03:00.0] TRAP ch 2 [0x007f96f000
X[12349]]
[681797.724241] nouveau E[  PGRAPH][0000:03:00.0] ROP0 0x80000000 0x80000001
[681797.724245] nouveau E[  PGRAPH][0000:03:00.0] ROP1 0x80000000 0x80000001
[681807.861455] nouveau E[kwin[1835]] failed to idle channel 0xcccc0000
[kwin[1835]]
[681809.865465] nouveau E[   PFIFO][0000:03:00.0] playlist 0 update timeout
[681810.988917] nouveau E[  PGRAPH][0000:03:00.0] TRAP ch 2 [0x007f96f000
X[12349]]
[681810.988925] nouveau E[  PGRAPH][0000:03:00.0] ROP0 0x80000000 0x80000001
[681810.988929] nouveau E[  PGRAPH][0000:03:00.0] ROP1 0x80000000 0x80000001
[681824.253604] nouveau E[  PGRAPH][0000:03:00.0] TRAP ch 2 [0x007f96f000
X[12349]]
[681824.253611] nouveau E[  PGRAPH][0000:03:00.0] ROP0 0x80000000 0x80000001
[681824.253616] nouveau E[  PGRAPH][0000:03:00.0] ROP1 0x80000000 0x80000001
[681824.876572] nouveau E[amarok[1964]] failed to idle channel 0xcccc0000
[amarok[1964]]
[681824.877570] [sched_delayed] sched: RT throttling activated
[681837.518292] nouveau E[  PGRAPH][0000:03:00.0] TRAP ch 2 [0x007f96f000
X[12349]]
[681837.518300] nouveau E[  PGRAPH][0000:03:00.0] ROP0 0x80000000 0x80000001
[681837.518304] nouveau E[  PGRAPH][0000:03:00.0] ROP1 0x80000000 0x80000001
[681839.887268] nouveau E[amarok[1964]] failed to idle channel 0xcccc0000
[amarok[1964]]
[681841.891290] nouveau E[   PFIFO][0000:03:00.0] playlist 0 update timeout
[681850.783002] nouveau E[  PGRAPH][0000:03:00.0] TRAP ch 2 [0x007f96f000
X[12349]]
[681850.783011] nouveau E[  PGRAPH][0000:03:00.0] ROP0 0x80000000 0x80000001
[681850.783015] nouveau E[  PGRAPH][0000:03:00.0] ROP1 0x80000000 0x80000001
[681864.047688] nouveau E[  PGRAPH][0000:03:00.0] TRAP ch 2 [0x007f96f000
X[12349]]
[681864.047696] nouveau E[  PGRAPH][0000:03:00.0] ROP0 0x80000000 0x80000001
[681864.047700] nouveau E[  PGRAPH][0000:03:00.0] ROP1 0x80000000 0x80000001
[681877.312386] nouveau E[  PGRAPH][0000:03:00.0] TRAP ch 2 [0x007f96f000
X[12349]]
[681877.312394] nouveau E[  PGRAPH][0000:03:00.0] ROP0 0x80000000 0x80000001
[681877.312398] nouveau E[  PGRAPH][0000:03:00.0] ROP1 0x80000000 0x80000001
[681890.577062] nouveau E[  PGRAPH][0000:03:00.0] TRAP ch 2 [0x007f96f000
X[12349]]
[681890.577070] nouveau E[  PGRAPH][0000:03:00.0] ROP0 0x80000000 0x80000001
[681890.577074] nouveau E[  PGRAPH][0000:03:00.0] ROP1 0x80000000 0x80000001
[681903.841732] nouveau E[  PGRAPH][0000:03:00.0] TRAP ch 2 [0x007f96f000
X[12349]]
[681903.841741] nouveau E[  PGRAPH][0000:03:00.0] ROP0 0x80000000 0x80000001
[681903.841745] nouveau E[  PGRAPH][0000:03:00.0] ROP1 0x80000000 0x80000001
[681913.097443] nouveau E[X[12349]] failed to idle channel 0xcccc0001
[X[12349]]
[681917.106418] nouveau E[  PGRAPH][0000:03:00.0] TRAP ch 2 [0x007f96f000
X[12349]]
[681917.106426] nouveau E[  PGRAPH][0000:03:00.0] ROP0 0x80000000 0x80000001
[681917.106430] nouveau E[  PGRAPH][0000:03:00.0] ROP1 0x80000000 0x80000001
[681928.108139] nouveau E[X[12349]] failed to idle channel 0xcccc0001
[X[12349]]
[681930.112203] nouveau E[   PFIFO][0000:03:00.0] playlist 0 update timeout
[681930.371105] nouveau E[  PGRAPH][0000:03:00.0] TRAP ch 2 [0x007f96f000
X[12349]]
[681930.371113] nouveau E[  PGRAPH][0000:03:00.0] ROP0 0x80000000 0x80000001
[681930.371117] nouveau E[  PGRAPH][0000:03:00.0] ROP1 0x80000000 0x80000001

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1386169006.6cFD7ECa1.8704
Date: Wed, 4 Dec 2013 14:56:46 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Fedora 19 64-bit X crash"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72315">72315</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Fedora 19 64-bit X crash
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>bryan.coleman&#64;dart.biz
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I am running Fedora 19 kernel 3.11.9-200.fc19.x86_64.  My X session went blank
and a console window started spewing the following messages.  Restarted the
system and all is well now.

xorg-x11-server 1.14.4-3.fc19

dmesg:
[434020.166070] nouveau E[   PIBUS][0000:03:00.0] GPC0: 0x505014 0x00000004
(0x04000200)
[477412.197564] nouveau E[   PIBUS][0000:03:00.0] GPC0: 0x505014 0x00000004
(0x04000200)
[544227.607544] nouveau E[   PIBUS][0000:03:00.0] GPC0: 0x505014 0x00000004
(0x04000200)
[681684.974381] nouveau E[   PFIFO][0000:03:00.0] PFIFO: write fault at
0x00002a0000 [PAGE_NOT_PRESENT] from (unknown enum 0x00000000)/GPC0/(unknown
enum 0x0000000f) on channel 0x007f96f000 [unknown]
[681691.606820] nouveau E[  PGRAPH][0000:03:00.0] TRAP ch 2 [0x007f96f000
X[1473]]
[681691.606833] nouveau E[  PGRAPH][0000:03:00.0] ROP0 0x80000000 0x80000001
[681691.606839] nouveau E[  PGRAPH][0000:03:00.0] ROP1 0x80000000 0x80000001
[681704.871500] nouveau E[  PGRAPH][0000:03:00.0] TRAP ch 2 [0x007f96f000
X[1473]]
[681704.871512] nouveau E[  PGRAPH][0000:03:00.0] ROP0 0x80000000 0x80000001
[681704.871518] nouveau E[  PGRAPH][0000:03:00.0] ROP1 0x80000000 0x80000001
[681707.939524] nouveau E[     DRM] GPU lockup - switching to software fbcon
[681718.136111] nouveau E[  PGRAPH][0000:03:00.0] TRAP ch 2 [0x007f96f000
X[1473]]
[681718.136144] nouveau E[  PGRAPH][0000:03:00.0] ROP0 0x80000000 0x80000001
[681718.136166] nouveau E[  PGRAPH][0000:03:00.0] ROP1 0x80000000 0x80000001
[681723.678476] nouveau E[ X[1473]] failed to idle channel 0xcccc0001 [X[1473]]
[681731.400803] nouveau E[  PGRAPH][0000:03:00.0] TRAP ch 2 [0x007f96f000
X[1473]]
[681731.400833] nouveau E[  PGRAPH][0000:03:00.0] ROP0 0x80000000 0x80000001
[681731.400855] nouveau E[  PGRAPH][0000:03:00.0] ROP1 0x80000000 0x80000001
[681738.689165] nouveau E[ X[1473]] failed to idle channel 0xcccc0001 [X[1473]]
[681740.693295] nouveau E[   PFIFO][0000:03:00.0] playlist 0 update timeout
[681742.989755] nouveau W[   PFIFO][0000:03:00.0] unknown status 0x00000100
[681744.665484] nouveau E[  PGRAPH][0000:03:00.0] TRAP ch 2 [0x007f96f000
X[1473]]
[681744.665516] nouveau E[  PGRAPH][0000:03:00.0] ROP0 0x80000000 0x80000001
[681744.665538] nouveau E[  PGRAPH][0000:03:00.0] ROP1 0x80000000 0x80000001
[681747.287525] nouveau W[   PFIFO][0000:03:00.0] unknown status 0x00000100
[681751.585296] nouveau W[   PFIFO][0000:03:00.0] unknown status 0x00000100
[681755.704304] nouveau E[ X[1473]] failed to idle channel 0xcccc0000 [X[1473]]
[681755.883068] nouveau W[   PFIFO][0000:03:00.0] unknown status 0x00000100
[681757.930171] nouveau E[  PGRAPH][0000:03:00.0] TRAP ch 2 [0x007f96f000
X[1473]]
[681757.930200] nouveau E[  PGRAPH][0000:03:00.0] ROP0 0x80000000 0x80000001
[681757.930222] nouveau E[  PGRAPH][0000:03:00.0] ROP1 0x80000000 0x80000001
[681760.180832] nouveau W[   PFIFO][0000:03:00.0] unknown status 0x00000100
[681764.478598] nouveau W[   PFIFO][0000:03:00.0] unknown status 0x00000100
[681768.776363] nouveau W[   PFIFO][0000:03:00.0] unknown status 0x00000100
[681770.714985] nouveau E[ X[1473]] failed to idle channel 0xcccc0000 [X[1473]]
[681771.194848] nouveau E[  PGRAPH][0000:03:00.0] TRAP ch 2 [0x007f96f000
X[1473]]
[681771.194877] nouveau E[  PGRAPH][0000:03:00.0] ROP0 0x80000000 0x80000001
[681771.194899] nouveau E[  PGRAPH][0000:03:00.0] ROP1 0x80000000 0x80000001
[681772.716434] nouveau E[   PFIFO][0000:03:00.0] channel 2 [X[1473]] kick
timeout
[681772.716924] nouveau W[   PFIFO][0000:03:00.0] unknown status 0x00000100
[681774.718239] nouveau E[   PFIFO][0000:03:00.0] channel 2 [X[1473]] kick
timeout
[681774.720867] nouveau W[   PFIFO][0000:03:00.0] unknown status 0x00000100
[681776.722174] nouveau E[   PFIFO][0000:03:00.0] playlist 0 update timeout
[681776.722197] nouveau ![   PFIFO][0000:03:00.0] unhandled status 0x00000001
[681780.482484] nouveau E[   PFIFO][0000:03:00.0] playlist 0 update timeout
[681782.497932] nouveau E[   PFIFO][0000:03:00.0] playlist 0 update timeout
[681784.459542] nouveau E[  PGRAPH][0000:03:00.0] TRAP ch 2 [0x007f96f000
X[12349]]
[681784.459551] nouveau E[  PGRAPH][0000:03:00.0] ROP0 0x80000000 0x80000001
[681784.459555] nouveau E[  PGRAPH][0000:03:00.0] ROP1 0x80000000 0x80000001
[681792.850755] nouveau E[kwin[1835]] failed to idle channel 0xcccc0000
[kwin[1835]]
[681797.724232] nouveau E[  PGRAPH][0000:03:00.0] TRAP ch 2 [0x007f96f000
X[12349]]
[681797.724241] nouveau E[  PGRAPH][0000:03:00.0] ROP0 0x80000000 0x80000001
[681797.724245] nouveau E[  PGRAPH][0000:03:00.0] ROP1 0x80000000 0x80000001
[681807.861455] nouveau E[kwin[1835]] failed to idle channel 0xcccc0000
[kwin[1835]]
[681809.865465] nouveau E[   PFIFO][0000:03:00.0] playlist 0 update timeout
[681810.988917] nouveau E[  PGRAPH][0000:03:00.0] TRAP ch 2 [0x007f96f000
X[12349]]
[681810.988925] nouveau E[  PGRAPH][0000:03:00.0] ROP0 0x80000000 0x80000001
[681810.988929] nouveau E[  PGRAPH][0000:03:00.0] ROP1 0x80000000 0x80000001
[681824.253604] nouveau E[  PGRAPH][0000:03:00.0] TRAP ch 2 [0x007f96f000
X[12349]]
[681824.253611] nouveau E[  PGRAPH][0000:03:00.0] ROP0 0x80000000 0x80000001
[681824.253616] nouveau E[  PGRAPH][0000:03:00.0] ROP1 0x80000000 0x80000001
[681824.876572] nouveau E[amarok[1964]] failed to idle channel 0xcccc0000
[amarok[1964]]
[681824.877570] [sched_delayed] sched: RT throttling activated
[681837.518292] nouveau E[  PGRAPH][0000:03:00.0] TRAP ch 2 [0x007f96f000
X[12349]]
[681837.518300] nouveau E[  PGRAPH][0000:03:00.0] ROP0 0x80000000 0x80000001
[681837.518304] nouveau E[  PGRAPH][0000:03:00.0] ROP1 0x80000000 0x80000001
[681839.887268] nouveau E[amarok[1964]] failed to idle channel 0xcccc0000
[amarok[1964]]
[681841.891290] nouveau E[   PFIFO][0000:03:00.0] playlist 0 update timeout
[681850.783002] nouveau E[  PGRAPH][0000:03:00.0] TRAP ch 2 [0x007f96f000
X[12349]]
[681850.783011] nouveau E[  PGRAPH][0000:03:00.0] ROP0 0x80000000 0x80000001
[681850.783015] nouveau E[  PGRAPH][0000:03:00.0] ROP1 0x80000000 0x80000001
[681864.047688] nouveau E[  PGRAPH][0000:03:00.0] TRAP ch 2 [0x007f96f000
X[12349]]
[681864.047696] nouveau E[  PGRAPH][0000:03:00.0] ROP0 0x80000000 0x80000001
[681864.047700] nouveau E[  PGRAPH][0000:03:00.0] ROP1 0x80000000 0x80000001
[681877.312386] nouveau E[  PGRAPH][0000:03:00.0] TRAP ch 2 [0x007f96f000
X[12349]]
[681877.312394] nouveau E[  PGRAPH][0000:03:00.0] ROP0 0x80000000 0x80000001
[681877.312398] nouveau E[  PGRAPH][0000:03:00.0] ROP1 0x80000000 0x80000001
[681890.577062] nouveau E[  PGRAPH][0000:03:00.0] TRAP ch 2 [0x007f96f000
X[12349]]
[681890.577070] nouveau E[  PGRAPH][0000:03:00.0] ROP0 0x80000000 0x80000001
[681890.577074] nouveau E[  PGRAPH][0000:03:00.0] ROP1 0x80000000 0x80000001
[681903.841732] nouveau E[  PGRAPH][0000:03:00.0] TRAP ch 2 [0x007f96f000
X[12349]]
[681903.841741] nouveau E[  PGRAPH][0000:03:00.0] ROP0 0x80000000 0x80000001
[681903.841745] nouveau E[  PGRAPH][0000:03:00.0] ROP1 0x80000000 0x80000001
[681913.097443] nouveau E[X[12349]] failed to idle channel 0xcccc0001
[X[12349]]
[681917.106418] nouveau E[  PGRAPH][0000:03:00.0] TRAP ch 2 [0x007f96f000
X[12349]]
[681917.106426] nouveau E[  PGRAPH][0000:03:00.0] ROP0 0x80000000 0x80000001
[681917.106430] nouveau E[  PGRAPH][0000:03:00.0] ROP1 0x80000000 0x80000001
[681928.108139] nouveau E[X[12349]] failed to idle channel 0xcccc0001
[X[12349]]
[681930.112203] nouveau E[   PFIFO][0000:03:00.0] playlist 0 update timeout
[681930.371105] nouveau E[  PGRAPH][0000:03:00.0] TRAP ch 2 [0x007f96f000
X[12349]]
[681930.371113] nouveau E[  PGRAPH][0000:03:00.0] ROP0 0x80000000 0x80000001
[681930.371117] nouveau E[  PGRAPH][0000:03:00.0] ROP1 0x80000000 0x80000001</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1386169006.6cFD7ECa1.8704--

--===============1614975727==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1614975727==--
