From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67051] No nouveau HDMI sound on NVIDIA GT430
Date: Sat, 20 Jul 2013 22:28:53 +0000
Message-ID: <bug-67051-8800-wJtLEcoZfq@http.bugs.freedesktop.org/>
References: <bug-67051-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2100436211=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67051-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2100436211==
Content-Type: multipart/alternative; boundary="1374359333.77e32B41.2280"; charset="us-ascii"


--1374359333.77e32B41.2280
Date: Sat, 20 Jul 2013 22:28:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67051

--- Comment #36 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #35)
> Hi Ilia,
> 
> > 8e9e3d2deacc460fbb8a4691140318f6e85e6891 + 
> > hdmi-1.patch + hdminva3.patch + hdminva3-3.patch
> 
> Not good news:  Good 'eld#3.0',  No HDMI sound

OK. That means there's something else still that I'm missing :(

> 
> I'd like you to take a little time to review my procedure, correct it if
> necessary, and thus keep us in sync.
> 
> cd /root/linux                                  # Linus directory
> make mrproper
> git checkout 8e9e3d2deacc460fbb8a4691140318f6e85e6891
> # At this point, files to be patched are each copied ('cp -p') to
> <name>-orig.
> cd /root/Temp                                   # Patch directory
> cp -p ../linux/drivers/gpu/drm/nouveau/core/engine/disp/hdanva3.c-orig
> hdanva3.c
> cp -p ../linux/drivers/gpu/drm/nouveau/core/engine/disp/hdminva3.c-orig
> hdminva3.c
> cp -p ../linux/drivers/gpu/drm/nouveau/core/engine/disp/hdminv84.c-orig
> hdminv84.c
> #
> patch -Np8 -i hdmi-1.patch ; echo $?
> patch -Np8 -i hdminva3.patch ; echo $?
> patch -Np8 -i hdminva3-3.patch ; echo $?
> cp -p {hdanva3,hdminva3,hdminv84}.c                  
> /root/linux/drivers/gpu/drm/nouveau/core/engine/disp/

That does seem like it would work, but definitely not the way that I'd do it.
I'd do more like

cd linux
git checkout 8e9e3d2deacc460fbb8a4691140318f6e85e6891
git checkout drivers/gpu/drm/nouveau (this should remove any local changes you
have in that dir on tracked files)
patch -p1 < hdmi-1.patch
patch -p1 < hdminva3.patch
patch -p1 < hdminva3-3.patch

> # Build, reboot, test:
> cat /proc/asound/card1/eld#3.0                  # Good, Bad?
> aplay -D plughw:1,9 test.wav                    # HDMI sound?
> 
> -- Alex

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374359333.77e32B41.2280
Date: Sat, 20 Jul 2013 22:28:53 +0000
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
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051#c36">Comment # 36</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051">bug 67051</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=67051#c35">comment #35</a>)
<span class="quote">&gt; Hi Ilia,
&gt; 
&gt; &gt; 8e9e3d2deacc460fbb8a4691140318f6e85e6891 + 
&gt; &gt; hdmi-1.patch + hdminva3.patch + hdminva3-3.patch
&gt; 
&gt; Not good news:  Good 'eld#3.0',  No HDMI sound</span >

OK. That means there's something else still that I'm missing :(

<span class="quote">&gt; 
&gt; I'd like you to take a little time to review my procedure, correct it if
&gt; necessary, and thus keep us in sync.
&gt; 
&gt; cd /root/linux                                  # Linus directory
&gt; make mrproper
&gt; git checkout 8e9e3d2deacc460fbb8a4691140318f6e85e6891
&gt; # At this point, files to be patched are each copied ('cp -p') to
&gt; &lt;name&gt;-orig.
&gt; cd /root/Temp                                   # Patch directory
&gt; cp -p ../linux/drivers/gpu/drm/nouveau/core/engine/disp/hdanva3.c-orig
&gt; hdanva3.c
&gt; cp -p ../linux/drivers/gpu/drm/nouveau/core/engine/disp/hdminva3.c-orig
&gt; hdminva3.c
&gt; cp -p ../linux/drivers/gpu/drm/nouveau/core/engine/disp/hdminv84.c-orig
&gt; hdminv84.c
&gt; #
&gt; patch -Np8 -i hdmi-1.patch ; echo $?
&gt; patch -Np8 -i hdminva3.patch ; echo $?
&gt; patch -Np8 -i hdminva3-3.patch ; echo $?
&gt; cp -p {hdanva3,hdminva3,hdminv84}.c                  
&gt; /root/linux/drivers/gpu/drm/nouveau/core/engine/disp/</span >

That does seem like it would work, but definitely not the way that I'd do it.
I'd do more like

cd linux
git checkout 8e9e3d2deacc460fbb8a4691140318f6e85e6891
git checkout drivers/gpu/drm/nouveau (this should remove any local changes you
have in that dir on tracked files)
patch -p1 &lt; hdmi-1.patch
patch -p1 &lt; hdminva3.patch
patch -p1 &lt; hdminva3-3.patch

<span class="quote">&gt; # Build, reboot, test:
&gt; cat /proc/asound/card1/eld#3.0                  # Good, Bad?
&gt; aplay -D plughw:1,9 test.wav                    # HDMI sound?
&gt; 
&gt; -- Alex</span ></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374359333.77e32B41.2280--

--===============2100436211==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2100436211==--
