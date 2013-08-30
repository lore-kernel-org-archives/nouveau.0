From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 51798] Cannot enable second video card on nvidia
	quadro NVS420
Date: Fri, 30 Aug 2013 14:09:43 +0000
Message-ID: <bug-51798-8800-2LS3dPKFHI@http.bugs.freedesktop.org/>
References: <bug-51798-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1980342891=="
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


--===============1980342891==
Content-Type: multipart/alternative; boundary="1377871783.7FbEDfea2.30852"; charset="us-ascii"


--1377871783.7FbEDfea2.30852
Date: Fri, 30 Aug 2013 14:09:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=51798

--- Comment #4 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #3)
Slight improvement of Ilia's trick

grep . /sys/bus/pci/devices/*/drm/*/card*/{status,enabled}

> I think "enabled" is like "is there a KMS user that has enabled this
> connector" (probably something to do with assigned crtc's or who knows).
I think so too,
* status indicates if there is a connection (cable is plugged)
* whereas enabled - if the output enabled/is there a user that has enabled

> e.g. Xorg. Looking at your xorg log, it only loads for the first gpu. Do you
> have an xorg.conf that hardcodes the busid?
> 
Indeed, I was wondering why nouveau is loaded only once by X

A minimal xorg.conf like the following should do the job

Section "Device"
    Identifier  "Device0"
    Driver      "nouveau"
    # Actual PCI location of first card/gpu
    BusID       "PCI:3:0:0"
EndSection

Section "Device"
    Identifier  "Device1"
    Driver      "nouveau"
    # Actual PCI location of second card/gpu
    BusID       "PCI:4:0:0"
EndSection

Additionally if you're planning to use three or more outputs you might want to
setup xinerama/zaphod heads [1]

> In any case, I'd highly recommend retesting with a new kernel and
> xf86-video-nouveau (and maybe xorg-server).
Seconded


[1] http://nouveau.freedesktop.org/wiki/MultiMonitorDesktop/

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377871783.7FbEDfea2.30852
Date: Fri, 30 Aug 2013 14:09:43 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51798#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Cannot enable second video card on nvidia quadro NVS420"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51798">bug 51798</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=51798#c3">comment #3</a>)
Slight improvement of Ilia's trick

grep . /sys/bus/pci/devices/*/drm/*/card*/{status,enabled}

<span class="quote">&gt; I think &quot;enabled&quot; is like &quot;is there a KMS user that has enabled this
&gt; connector&quot; (probably something to do with assigned crtc's or who knows).</span >
I think so too,
* status indicates if there is a connection (cable is plugged)
* whereas enabled - if the output enabled/is there a user that has enabled

<span class="quote">&gt; e.g. Xorg. Looking at your xorg log, it only loads for the first gpu. Do you
&gt; have an xorg.conf that hardcodes the busid?
&gt; </span >
Indeed, I was wondering why nouveau is loaded only once by X

A minimal xorg.conf like the following should do the job

Section &quot;Device&quot;
    Identifier  &quot;Device0&quot;
    Driver      &quot;nouveau&quot;
    # Actual PCI location of first card/gpu
    BusID       &quot;PCI:3:0:0&quot;
EndSection

Section &quot;Device&quot;
    Identifier  &quot;Device1&quot;
    Driver      &quot;nouveau&quot;
    # Actual PCI location of second card/gpu
    BusID       &quot;PCI:4:0:0&quot;
EndSection

Additionally if you're planning to use three or more outputs you might want to
setup xinerama/zaphod heads [1]

<span class="quote">&gt; In any case, I'd highly recommend retesting with a new kernel and
&gt; xf86-video-nouveau (and maybe xorg-server).</span >
Seconded


[1] <a href="http://nouveau.freedesktop.org/wiki/MultiMonitorDesktop/">http://nouveau.freedesktop.org/wiki/MultiMonitorDesktop/</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377871783.7FbEDfea2.30852--

--===============1980342891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1980342891==--
