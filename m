From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56757] New: [regression][bisected][screenshots] nvfx
 -> nv30 driver rework causes regression in UrbanTerror4.2 (beta5)
Date: Mon, 05 Nov 2012 07:39:10 +0000
Message-ID: <bug-56757-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1749572705=="
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


--===============1749572705==
Content-Type: multipart/alternative; boundary="1352101150.36d20.25612"; charset="us-ascii"


--1352101150.36d20.25612
Date: Mon, 5 Nov 2012 07:39:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56757

          Priority: medium
            Bug ID: 56757
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [regression][bisected][screenshots] nvfx -> nv30
                    driver rework causes regression in UrbanTerror4.2
                    (beta5)
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Drivers/DRI/nouveau
           Product: Mesa

The fairly recent nvfx -> nv30 driver rework causes a regression in UrbanTerror
4.2 (beta 5). I have not been able to test other beta's or games.

The card identifies itself as:

01:00.0 VGA compatible controller: NVIDIA Corporation G73 [GeForce 7300 GT]
(rev a1) (prog-if 00 [VGA controller])
    Subsystem: ASUSTeK Computer Inc. Device 820e
01:00.0 0300: 10de:0393 (rev a1) (prog-if 00 [VGA controller])
    Subsystem: 1043:820e

[    0.312762] nouveau  [  DEVICE][0000:01:00.0] Chipset: G73 (NV4B)
[    0.312764] nouveau  [  DEVICE][0000:01:00.0] Family : NV40

The problem, is that exactly after the 'big change' the gamescreen loads
partially. I have screenshosts attached.

The game itself seems to work fine, but almost 75% to 90% of the loading screen
is still on top of it. The first glitches appear during loading. After the game
has loaded the map, then it seems that the screen 'rips'. Again check the
screenshots for this. This behaviour only occurs on some maps, not all. Some of
them:

- Kingdom
- Cascade
- Bohemia
- Oildepot
- Maybe more...

The way the screen 'distorts' differs per map or per game setting. Sometimes
it's a only a triangular shape on the top left upper corner of the game that is
visible. So it doesn't have to be across the entire screen.

The tested git versions are:

bad
mesa: f2509df95cd1d055e91b1558c5d9c5a935067d78
libdrm: 292da616fe1f936ca78a3fa8e1b1b19883e343b6

good
mesa: 1f2b53945115f9b54933af1412d3cc0eb16a877f (5 commits difference)
libdrm: 0d6350002d74848dd3d1e4d28d514a7ac9d580c9 (1 commit difference)

Testing latest git of mesa and libdrm did not fix the problem.

I could not test a single commit since the rework seems to take up several
patches. I.e. removing and adding the new 3D driver is done in two seperate
patches as is porting to libdrm2.0 which depends on this. So in order to test
this without building errors I had to skip 5 patches instead of 1
unfortunately.

I have attached several logs and screenshots that will hopefully help you
further.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1352101150.36d20.25612
Date: Mon, 5 Nov 2012 07:39:10 +0000
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
   title="NEW --- - [regression][bisected][screenshots] nvfx -&gt; nv30 driver rework causes regression in UrbanTerror4.2 (beta5)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56757">56757</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[regression][bisected][screenshots] nvfx -&gt; nv30 driver rework causes regression in UrbanTerror4.2 (beta5)
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
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>ronald645&#64;gmail.com
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
        <pre>The fairly recent nvfx -&gt; nv30 driver rework causes a regression in UrbanTerror
4.2 (beta 5). I have not been able to test other beta's or games.

The card identifies itself as:

01:00.0 VGA compatible controller: NVIDIA Corporation G73 [GeForce 7300 GT]
(rev a1) (prog-if 00 [VGA controller])
    Subsystem: ASUSTeK Computer Inc. Device 820e
01:00.0 0300: 10de:0393 (rev a1) (prog-if 00 [VGA controller])
    Subsystem: 1043:820e

[    0.312762] nouveau  [  DEVICE][0000:01:00.0] Chipset: G73 (NV4B)
[    0.312764] nouveau  [  DEVICE][0000:01:00.0] Family : NV40

The problem, is that exactly after the 'big change' the gamescreen loads
partially. I have screenshosts attached.

The game itself seems to work fine, but almost 75% to 90% of the loading screen
is still on top of it. The first glitches appear during loading. After the game
has loaded the map, then it seems that the screen 'rips'. Again check the
screenshots for this. This behaviour only occurs on some maps, not all. Some of
them:

- Kingdom
- Cascade
- Bohemia
- Oildepot
- Maybe more...

The way the screen 'distorts' differs per map or per game setting. Sometimes
it's a only a triangular shape on the top left upper corner of the game that is
visible. So it doesn't have to be across the entire screen.

The tested git versions are:

bad
mesa: f2509df95cd1d055e91b1558c5d9c5a935067d78
libdrm: 292da616fe1f936ca78a3fa8e1b1b19883e343b6

good
mesa: 1f2b53945115f9b54933af1412d3cc0eb16a877f (5 commits difference)
libdrm: 0d6350002d74848dd3d1e4d28d514a7ac9d580c9 (1 commit difference)

Testing latest git of mesa and libdrm did not fix the problem.

I could not test a single commit since the rework seems to take up several
patches. I.e. removing and adding the new 3D driver is done in two seperate
patches as is porting to libdrm2.0 which depends on this. So in order to test
this without building errors I had to skip 5 patches instead of 1
unfortunately.

I have attached several logs and screenshots that will hopefully help you
further.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1352101150.36d20.25612--

--===============1749572705==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1749572705==--
