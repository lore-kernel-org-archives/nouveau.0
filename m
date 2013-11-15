From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71662] New: [nvd9 regression] 3d application hang
Date: Fri, 15 Nov 2013 22:32:02 +0000
Message-ID: <bug-71662-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0405975849=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============0405975849==
Content-Type: multipart/alternative; boundary="1384554722.F17d0.23438"; charset="us-ascii"


--1384554722.F17d0.23438
Date: Fri, 15 Nov 2013 22:32:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71662

          Priority: medium
            Bug ID: 71662
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [nvd9 regression] 3d application hang
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: jano.vesely-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Drivers/DRI/nouveau
           Product: Mesa

This is a regression from 3.12 to 3.13 (still present on nouveau master).
I started seeing these in dmesg:
[   64.358170] hda-codec: out of range cmd 0:6:707:fffffffc
[ 2310.511292] nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
[ 2310.778618] nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
[ 2310.837097] nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
[ 2310.895963] nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
[ 2311.231493] nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
[ 2311.326618] nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
[ 2311.466523] nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
[ 2312.081457] nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
[ 2312.118070] nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
[ 2312.484497] nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
[ 2312.690892] nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
[ 2312.854135] nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
[ 2313.160414] nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
[ 2313.421500] nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
[ 2313.878647] nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
[ 2314.296446] nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
[ 2314.440653] nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
[ 2315.068705] nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
[ 2315.089576] nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
[ 2315.414808] nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
[ 2315.777496] nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
[ 2315.900813] nouveau ![   PFIFO][0000:01:00.0] unhandled status 0x00800000

I'm using mesa git master. Sometimes openarena (exec anholt) finishes OK with
just the warnings (tons of them), occasionally it hangs with the last message.
The hang appears to happen more often on nouveau master than vanilla 3.12
The card is:
[   10.238807] nouveau  [  DEVICE][0000:01:00.0] Chipset: GF119 (NVD9)
[   10.238809] nouveau  [  DEVICE][0000:01:00.0] Family : NVD0
couple with snb intel.

the bug is perfectly reproducable, let me know what other info I can provide.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1384554722.F17d0.23438
Date: Fri, 15 Nov 2013 22:32:02 +0000
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
   title="NEW --- - [nvd9 regression] 3d application hang"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71662">71662</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[nvd9 regression] 3d application hang
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>jano.vesely&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
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
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr></table>
      <p>
        <div>
        <pre>This is a regression from 3.12 to 3.13 (still present on nouveau master).
I started seeing these in dmesg:
[   64.358170] hda-codec: out of range cmd 0:6:707:fffffffc
[ 2310.511292] nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
[ 2310.778618] nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
[ 2310.837097] nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
[ 2310.895963] nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
[ 2311.231493] nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
[ 2311.326618] nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
[ 2311.466523] nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
[ 2312.081457] nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
[ 2312.118070] nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
[ 2312.484497] nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
[ 2312.690892] nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
[ 2312.854135] nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
[ 2313.160414] nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
[ 2313.421500] nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
[ 2313.878647] nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
[ 2314.296446] nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
[ 2314.440653] nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
[ 2315.068705] nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
[ 2315.089576] nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
[ 2315.414808] nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
[ 2315.777496] nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005
[ 2315.900813] nouveau ![   PFIFO][0000:01:00.0] unhandled status 0x00800000

I'm using mesa git master. Sometimes openarena (exec anholt) finishes OK with
just the warnings (tons of them), occasionally it hangs with the last message.
The hang appears to happen more often on nouveau master than vanilla 3.12
The card is:
[   10.238807] nouveau  [  DEVICE][0000:01:00.0] Chipset: GF119 (NVD9)
[   10.238809] nouveau  [  DEVICE][0000:01:00.0] Family : NVD0
couple with snb intel.

the bug is perfectly reproducable, let me know what other info I can provide.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1384554722.F17d0.23438--

--===============0405975849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0405975849==--
