From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 51798] Cannot enable second video card on nvidia
	quadro NVS420
Date: Sun, 25 Aug 2013 19:12:08 +0000
Message-ID: <bug-51798-8800-xHsIyNEJiI@http.bugs.freedesktop.org/>
References: <bug-51798-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0997897996=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-51798-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0997897996==
Content-Type: multipart/alternative; boundary="1377457928.d3f7F153.27382"; charset="us-ascii"


--1377457928.d3f7F153.27382
Date: Sun, 25 Aug 2013 19:12:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=51798

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
> ls /sys/bus/pci/devices/*/drm/*/card*/enabled | xargs -I {} -i bash -c "echo -n {}: ; cat {}"

Here's a neat trick:

grep . /sys/bus/pci/devices/*/drm/*/card*/enabled

I think "enabled" is like "is there a KMS user that has enabled this connector"
(probably something to do with assigned crtc's or who knows). e.g. Xorg.
Looking at your xorg log, it only loads for the first gpu. Do you have an
xorg.conf that hardcodes the busid?

In any case, I'd highly recommend retesting with a new kernel and
xf86-video-nouveau (and maybe xorg-server).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377457928.d3f7F153.27382
Date: Sun, 25 Aug 2013 19:12:08 +0000
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
   title="NEW --- - Cannot enable second video card on nvidia quadro NVS420"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51798#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Cannot enable second video card on nvidia quadro NVS420"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51798">bug 51798</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre><span class="quote">&gt; ls /sys/bus/pci/devices/*/drm/*/card*/enabled | xargs -I {} -i bash -c &quot;echo -n {}: ; cat {}&quot;</span >

Here's a neat trick:

grep . /sys/bus/pci/devices/*/drm/*/card*/enabled

I think &quot;enabled&quot; is like &quot;is there a KMS user that has enabled this connector&quot;
(probably something to do with assigned crtc's or who knows). e.g. Xorg.
Looking at your xorg log, it only loads for the first gpu. Do you have an
xorg.conf that hardcodes the busid?

In any case, I'd highly recommend retesting with a new kernel and
xf86-video-nouveau (and maybe xorg-server).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377457928.d3f7F153.27382--

--===============0997897996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0997897996==--
