From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59474] fedora 18 X server crashes after boot
Date: Fri, 18 Jan 2013 09:25:00 +0000
Message-ID: <bug-59474-8800-bRE31UGUJ7@http.bugs.freedesktop.org/>
References: <bug-59474-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0537540361=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59474-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0537540361==
Content-Type: multipart/alternative; boundary="1358501099.dADaFA1.5920"; charset="us-ascii"


--1358501099.dADaFA1.5920
Date: Fri, 18 Jan 2013 09:24:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59474

--- Comment #6 from Philippe Dax <dax-jpENlDPnyY8@public.gmane.org> ---
(In reply to comment #3)
> > Xorg.0.log
> > Fatal server error:
> > [   212.065] xf86OpenConsole: VT_ACTIVATE failed: No such device or address
> 
> I think this is the error message and it should refer to a failed open of a
> virtual terminal (may be /dev/fb0 or /dev/tty*).
> 
> Can you manually switch to other virtual terminals?
> Can you manually start X?
> 
> Is this issue related?
> 
> http://forums.fedoraforum.org/showthread.php?p=1625857
> 
> 
> Ciao!

This message occures after installing 
yum install xorg-x11-drv-nouveau

The original message was :

[   801.991] Initializing built-in extension DRI2
[   801.991] (II) LoadModule: "glx"
[   801.991] (II) Loading /usr/lib64/xorg/modules/extensions/libglx.so
[   801.991] (II) Module glx: vendor="X.Org Foundation"
[   801.991]     compiled for 1.13.1, module version = 1.0.0
[   801.991]     ABI class: X.Org Server Extension, version 7.0
[   801.991] (==) AIGLX enabled
[   801.991] Loading extension GLX
[   801.991] (==) Matched nouveau as autoconfigured driver 0
[   801.991] (==) Matched nv as autoconfigured driver 1
[   801.991] (==) Matched nouveau as autoconfigured driver 2
[   801.991] (==) Matched nv as autoconfigured driver 3
[   801.992] (==) Matched vesa as autoconfigured driver 4
[   801.992] (==) Matched modesetting as autoconfigured driver 5
[   801.992] (==) Matched fbdev as autoconfigured driver 6
[   801.992] (==) Assigned the driver to the xf86ConfigLayout
[   801.992] (II) LoadModule: "nouveau"
[   801.992] (WW) Warning, couldn't open module nouveau
[   801.992] (II) UnloadModule: "nouveau"
[   801.992] (II) Unloading nouveau
[   801.992] (EE) Failed to load module "nouveau" (module does not exist, 0)
[   801.992] (II) LoadModule: "nv"
[   801.992] (WW) Warning, couldn't open module nv
[   801.992] (II) UnloadModule: "nv"
[   801.992] (II) Unloading nv
[   801.992] (EE) Failed to load module "nv" (module does not exist, 0)
[   801.992] (II) LoadModule: "vesa"
[   801.992] (WW) Warning, couldn't open module vesa
[   801.992] (II) UnloadModule: "vesa"
[   801.992] (II) Unloading vesa
[   801.992] (EE) Failed to load module "vesa" (module does not exist, 0)
[   801.992] (II) LoadModule: "modesetting"
[   801.992] (WW) Warning, couldn't open module modesetting
[   801.992] (II) UnloadModule: "modesetting"
[   801.992] (II) Unloading modesetting
[   801.992] (EE) Failed to load module "modesetting" (module does not exist,
0)
[   801.992] (II) LoadModule: "fbdev"
[   801.992] (WW) Warning, couldn't open module fbdev
[   801.992] (II) UnloadModule: "fbdev"
[   801.992] (II) Unloading fbdev
[   801.992] (EE) Failed to load module "fbdev" (module does not exist, 0)
[   801.992] (EE) No drivers available.
[   801.992] 
Fatal server error:
[   801.992] no screens found
[   801.993] (EE)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1358501099.dADaFA1.5920
Date: Fri, 18 Jan 2013 09:24:59 +0000
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
   title="NEW --- - fedora 18 X server crashes after boot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59474#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - fedora 18 X server crashes after boot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59474">bug 59474</a>
              from <span class="vcard"><a class="email" href="mailto:dax&#64;enst.fr" title="Philippe Dax &lt;dax&#64;enst.fr&gt;"> <span class="fn">Philippe Dax</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=59474#c3">comment #3</a>)
<span class="quote">&gt; &gt; Xorg.0.log
&gt; &gt; Fatal server error:
&gt; &gt; [   212.065] xf86OpenConsole: VT_ACTIVATE failed: No such device or address
&gt; 
&gt; I think this is the error message and it should refer to a failed open of a
&gt; virtual terminal (may be /dev/fb0 or /dev/tty*).
&gt; 
&gt; Can you manually switch to other virtual terminals?
&gt; Can you manually start X?
&gt; 
&gt; Is this issue related?
&gt; 
&gt; <a href="http://forums.fedoraforum.org/showthread.php?p=1625857">http://forums.fedoraforum.org/showthread.php?p=1625857</a>
&gt; 
&gt; 
&gt; Ciao!</span >

This message occures after installing 
yum install xorg-x11-drv-nouveau

The original message was :

[   801.991] Initializing built-in extension DRI2
[   801.991] (II) LoadModule: &quot;glx&quot;
[   801.991] (II) Loading /usr/lib64/xorg/modules/extensions/libglx.so
[   801.991] (II) Module glx: vendor=&quot;X.Org Foundation&quot;
[   801.991]     compiled for 1.13.1, module version = 1.0.0
[   801.991]     ABI class: X.Org Server Extension, version 7.0
[   801.991] (==) AIGLX enabled
[   801.991] Loading extension GLX
[   801.991] (==) Matched nouveau as autoconfigured driver 0
[   801.991] (==) Matched nv as autoconfigured driver 1
[   801.991] (==) Matched nouveau as autoconfigured driver 2
[   801.991] (==) Matched nv as autoconfigured driver 3
[   801.992] (==) Matched vesa as autoconfigured driver 4
[   801.992] (==) Matched modesetting as autoconfigured driver 5
[   801.992] (==) Matched fbdev as autoconfigured driver 6
[   801.992] (==) Assigned the driver to the xf86ConfigLayout
[   801.992] (II) LoadModule: &quot;nouveau&quot;
[   801.992] (WW) Warning, couldn't open module nouveau
[   801.992] (II) UnloadModule: &quot;nouveau&quot;
[   801.992] (II) Unloading nouveau
[   801.992] (EE) Failed to load module &quot;nouveau&quot; (module does not exist, 0)
[   801.992] (II) LoadModule: &quot;nv&quot;
[   801.992] (WW) Warning, couldn't open module nv
[   801.992] (II) UnloadModule: &quot;nv&quot;
[   801.992] (II) Unloading nv
[   801.992] (EE) Failed to load module &quot;nv&quot; (module does not exist, 0)
[   801.992] (II) LoadModule: &quot;vesa&quot;
[   801.992] (WW) Warning, couldn't open module vesa
[   801.992] (II) UnloadModule: &quot;vesa&quot;
[   801.992] (II) Unloading vesa
[   801.992] (EE) Failed to load module &quot;vesa&quot; (module does not exist, 0)
[   801.992] (II) LoadModule: &quot;modesetting&quot;
[   801.992] (WW) Warning, couldn't open module modesetting
[   801.992] (II) UnloadModule: &quot;modesetting&quot;
[   801.992] (II) Unloading modesetting
[   801.992] (EE) Failed to load module &quot;modesetting&quot; (module does not exist,
0)
[   801.992] (II) LoadModule: &quot;fbdev&quot;
[   801.992] (WW) Warning, couldn't open module fbdev
[   801.992] (II) UnloadModule: &quot;fbdev&quot;
[   801.992] (II) Unloading fbdev
[   801.992] (EE) Failed to load module &quot;fbdev&quot; (module does not exist, 0)
[   801.992] (EE) No drivers available.
[   801.992] 
Fatal server error:
[   801.992] no screens found
[   801.993] (EE)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1358501099.dADaFA1.5920--

--===============0537540361==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0537540361==--
