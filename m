From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69375] [NV4E] GPU lockup when using chrome/flash
Date: Mon, 16 Sep 2013 15:25:13 +0000
Message-ID: <bug-69375-8800-zKWlDy7PlB@http.bugs.freedesktop.org/>
References: <bug-69375-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1881590129=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69375-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1881590129==
Content-Type: multipart/alternative; boundary="1379345113.D6CfdB4a2.20805"; charset="us-ascii"


--1379345113.D6CfdB4a2.20805
Date: Mon, 16 Sep 2013 15:25:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69375

Andrew Travneff <travneff-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Severity|normal                      |major
                 CC|                            |travneff-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #1 from Andrew Travneff <travneff-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Seems like I have same for a long time at NV43. Now happens 1-2 times a day,
very annoying. VT works after that, but reboot is necessary to launch X again.

Affected kernels are at least 3.6 .. 3.11. However it was much better before I
updated Fedora 18 -> 19. 3.11 seems the worst case since it adds much more
freeze and errors messages like "BUG: soft lockup - CPU#0 stuck for a ...".

Proprietary driver periodically prints errors after some desktop freeze. Can it
be a dying HW?

Debug kernel also prints a note about "possible circular locking dependency" in
drm / nouveau.

Reproducible with launching "Savage: Rebirth" game. I haven't tried another 3D
games, but use KDE desktop effects.

Also a render artefacts are shown sometimes, mostly in Firefox.

Besides that, is there a GPU recovery feature in Nouveau? What happened with
these patches: [3]?

More info: [1][2].
SW: Fedora 19 x64
  libdrm-2.4.46-1.fc19.x86_64
  xorg-x11-server-Xorg-1.14.2-9.fc19.x86_64
  xorg-x11-drv-nouveau-1.0.9-1.fc19.x86_64

HW: 01:00.0 VGA compatible controller [0300]: NVIDIA Corporation NV43 [GeForce
6600] [10de:0141] (rev a2)

1: https://bugzilla.redhat.com/show_bug.cgi?id=979537

2: https://bugzilla.redhat.com/show_bug.cgi?id=868482

3: http://lists.freedesktop.org/archives/nouveau/2012-April/010199.html

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1379345113.D6CfdB4a2.20805
Date: Mon, 16 Sep 2013 15:25:13 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:travneff&#64;gmail.com" title="Andrew Travneff &lt;travneff&#64;gmail.com&gt;"> <span class="fn">Andrew Travneff</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV4E] GPU lockup when using chrome/flash"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69375">bug 69375</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Severity</td>
           <td>normal
           </td>
           <td>major
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>travneff&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV4E] GPU lockup when using chrome/flash"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69375#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV4E] GPU lockup when using chrome/flash"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69375">bug 69375</a>
              from <span class="vcard"><a class="email" href="mailto:travneff&#64;gmail.com" title="Andrew Travneff &lt;travneff&#64;gmail.com&gt;"> <span class="fn">Andrew Travneff</span></a>
</span></b>
        <pre>Seems like I have same for a long time at NV43. Now happens 1-2 times a day,
very annoying. VT works after that, but reboot is necessary to launch X again.

Affected kernels are at least 3.6 .. 3.11. However it was much better before I
updated Fedora 18 -&gt; 19. 3.11 seems the worst case since it adds much more
freeze and errors messages like &quot;BUG: soft lockup - CPU#0 stuck for a ...&quot;.

Proprietary driver periodically prints errors after some desktop freeze. Can it
be a dying HW?

Debug kernel also prints a note about &quot;possible circular locking dependency&quot; in
drm / nouveau.

Reproducible with launching &quot;Savage: Rebirth&quot; game. I haven't tried another 3D
games, but use KDE desktop effects.

Also a render artefacts are shown sometimes, mostly in Firefox.

Besides that, is there a GPU recovery feature in Nouveau? What happened with
these patches: [3]?

More info: [1][2].
SW: Fedora 19 x64
  libdrm-2.4.46-1.fc19.x86_64
  xorg-x11-server-Xorg-1.14.2-9.fc19.x86_64
  xorg-x11-drv-nouveau-1.0.9-1.fc19.x86_64

HW: 01:00.0 VGA compatible controller [0300]: NVIDIA Corporation NV43 [GeForce
6600] [10de:0141] (rev a2)

1: <a href="https://bugzilla.redhat.com/show_bug.cgi?id=979537">https://bugzilla.redhat.com/show_bug.cgi?id=979537</a>

2: <a href="https://bugzilla.redhat.com/show_bug.cgi?id=868482">https://bugzilla.redhat.com/show_bug.cgi?id=868482</a>

3: <a href="http://lists.freedesktop.org/archives/nouveau/2012-April/010199.html">http://lists.freedesktop.org/archives/nouveau/2012-April/010199.html</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1379345113.D6CfdB4a2.20805--

--===============1881590129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1881590129==--
