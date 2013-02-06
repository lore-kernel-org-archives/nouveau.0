From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60369] New: src/nouveau_exa.c:142:31: error:
 'CREATE_PIXMAP_USAGE_SHARED' undeclared (first use in this function)
Date: Wed, 06 Feb 2013 14:52:16 +0000
Message-ID: <bug-60369-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2004417643=="
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


--===============2004417643==
Content-Type: multipart/alternative; boundary="1360162336.ab3b5b52.26364"; charset="us-ascii"


--1360162336.ab3b5b52.26364
Date: Wed, 6 Feb 2013 14:52:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60369

          Priority: medium
            Bug ID: 60369
                CC: airlied-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: src/nouveau_exa.c:142:31: error:
                    'CREATE_PIXMAP_USAGE_SHARED' undeclared (first use in
                    this function)
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: fabio.ped-VGgt2q2+T+FeoWH0uzbU5w@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Compiling on Ubuntu 12.04 leads to this error:

make[3]: Entering directory
`/build/buildd/xserver-xorg-video-nouveau-1.0.6+git1302061522.e8f222~gd~p/build/src'
  CC     nouveau_exa.lo
../../src/nouveau_exa.c: In function 'nouveau_exa_create_pixmap':
../../src/nouveau_exa.c:142:31: error: 'CREATE_PIXMAP_USAGE_SHARED' undeclared
(first use in this function)
../../src/nouveau_exa.c:142:31: note: each undeclared identifier is reported
only once for each function it appears in
make[3]: *** [nouveau_exa.lo] Error 1

Full log here:
https://launchpadlibrarian.net/130533746/buildlog_ubuntu-precise-i386.xserver-xorg-video-nouveau_1%3A1.0.6%2Bgit1302061522.e8f222~gd~p_FAILEDTOBUILD.txt.gz

Compiles fine on Ubuntu 12.10.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1360162336.ab3b5b52.26364
Date: Wed, 6 Feb 2013 14:52:16 +0000
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
   title="NEW --- - src/nouveau_exa.c:142:31: error: 'CREATE_PIXMAP_USAGE_SHARED' undeclared (first use in this function)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60369">60369</a>
          </td>
        </tr>

        <tr>
          <th>CC</th>
          <td>airlied&#64;freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>src/nouveau_exa.c:142:31: error: 'CREATE_PIXMAP_USAGE_SHARED' undeclared (first use in this function)
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
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
          <td>fabio.ped&#64;libero.it
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86 (IA32)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
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
        <pre>Compiling on Ubuntu 12.04 leads to this error:

make[3]: Entering directory
`/build/buildd/xserver-xorg-video-nouveau-1.0.6+git1302061522.e8f222~gd~p/build/src'
  CC     nouveau_exa.lo
../../src/nouveau_exa.c: In function 'nouveau_exa_create_pixmap':
../../src/nouveau_exa.c:142:31: error: 'CREATE_PIXMAP_USAGE_SHARED' undeclared
(first use in this function)
../../src/nouveau_exa.c:142:31: note: each undeclared identifier is reported
only once for each function it appears in
make[3]: *** [nouveau_exa.lo] Error 1

Full log here:
<a href="https://launchpadlibrarian.net/130533746/buildlog_ubuntu-precise-i386.xserver-xorg-video-nouveau_1%3A1.0.6%2Bgit1302061522.e8f222~gd~p_FAILEDTOBUILD.txt.gz">https://launchpadlibrarian.net/130533746/buildlog_ubuntu-precise-i386.xserver-xorg-video-nouveau_1%3A1.0.6%2Bgit1302061522.e8f222~gd~p_FAILEDTOBUILD.txt.gz</a>

Compiles fine on Ubuntu 12.10.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1360162336.ab3b5b52.26364--

--===============2004417643==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2004417643==--
