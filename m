From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59474] fedora 18 X server crashes after boot
Date: Fri, 18 Jan 2013 17:07:45 +0000
Message-ID: <bug-59474-8800-PTbjqdCwMQ@http.bugs.freedesktop.org/>
References: <bug-59474-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1814210326=="
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


--===============1814210326==
Content-Type: multipart/alternative; boundary="1358528865.1e02Dec1.29895"; charset="us-ascii"


--1358528865.1e02Dec1.29895
Date: Fri, 18 Jan 2013 17:07:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59474

--- Comment #7 from Philippe Dax <dax-jpENlDPnyY8@public.gmane.org> ---
I suspect a missing driver :

$ yum list |grep xorg-x11-drv
xorg-x11-drv-apm.x86_64                1.2.5-2.fc18                    fedora   
xorg-x11-drv-ast.x86_64                0.97.0-2.fc18                   fedora   
xorg-x11-drv-ati.x86_64                7.0.0-0.8.20121015gitbd9e2c064.fc18
xorg-x11-drv-catalyst.x86_64           12.11-0.3.beta11.fc18          
rpmfusion-nonfree
xorg-x11-drv-catalyst-devel.i686       12.11-0.3.beta11.fc18          
rpmfusion-nonfree
xorg-x11-drv-catalyst-devel.x86_64     12.11-0.3.beta11.fc18          
rpmfusion-nonfree
xorg-x11-drv-catalyst-libs.i686        12.11-0.3.beta11.fc18          
rpmfusion-nonfree
xorg-x11-drv-catalyst-libs.x86_64      12.11-0.3.beta11.fc18          
rpmfusion-nonfree
xorg-x11-drv-cirrus.x86_64             1.5.1-3.fc18                    fedora   
xorg-x11-drv-dummy.x86_64              0.3.6-2.fc18                    fedora   
xorg-x11-drv-evdev.x86_64              2.7.3-2.fc18                    fedora   
xorg-x11-drv-evdev-devel.i686          2.7.3-2.fc18                    fedora   
xorg-x11-drv-evdev-devel.x86_64        2.7.3-2.fc18                    fedora   
xorg-x11-drv-fbdev.x86_64              0.4.3-3.fc18                    fedora   
xorg-x11-drv-glint.x86_64              1.2.8-2.fc18                    fedora   
xorg-x11-drv-i128.x86_64               1.3.6-2.fc18                    fedora   
xorg-x11-drv-i740.x86_64               1.3.4-2.fc18                    fedora   
xorg-x11-drv-intel.i686                2.20.17-1.fc18                  updates  
xorg-x11-drv-intel.x86_64              2.20.17-1.fc18                  updates  
xorg-x11-drv-intel-devel.i686          2.20.17-1.fc18                  updates  
xorg-x11-drv-intel-devel.x86_64        2.20.17-1.fc18                  updates  
xorg-x11-drv-ivtv.x86_64               1.2.0-0.1.fc18                  fedora   
xorg-x11-drv-keyboard.x86_64           1.6.2-3.fc18                    fedora   
xorg-x11-drv-mach64.x86_64             6.9.3-6.fc18                    fedora   
xorg-x11-drv-mga.x86_64                1.6.1-2.fc18                    fedora   
xorg-x11-drv-modesetting.x86_64        0.4.0-4.fc18                    fedora   
xorg-x11-drv-mouse.x86_64              1.8.1-3.fc18                    fedora   
xorg-x11-drv-mouse-devel.i686          1.8.1-3.fc18                    fedora   
xorg-x11-drv-mouse-devel.x86_64        1.8.1-3.fc18                    fedora   
xorg-x11-drv-nouveau.x86_64            1:1.0.3-1.fc18                  fedora   
xorg-x11-drv-nv.x86_64                 2.1.20-2.fc18                   fedora   
xorg-x11-drv-nvidia.x86_64             1:304.64-3.fc18                
rpmfusion-nonfree
xorg-x11-drv-nvidia-173xx.x86_64       173.14.36-1.fc18               
rpmfusion-nonfree
xorg-x11-drv-nvidia-173xx-devel.i686   173.14.36-1.fc18               
rpmfusion-nonfree
xorg-x11-drv-nvidia-173xx-devel.x86_64 173.14.36-1.fc18               
rpmfusion-nonfree
xorg-x11-drv-nvidia-173xx-libs.i686    173.14.36-1.fc18               
rpmfusion-nonfree
xorg-x11-drv-nvidia-173xx-libs.x86_64  173.14.36-1.fc18               
rpmfusion-nonfree
xorg-x11-drv-nvidia-devel.i686         1:304.64-3.fc18                
rpmfusion-nonfree
xorg-x11-drv-nvidia-devel.x86_64       1:304.64-3.fc18                
rpmfusion-nonfree
xorg-x11-drv-nvidia-libs.i686          1:304.64-3.fc18                
rpmfusion-nonfree
...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1358528865.1e02Dec1.29895
Date: Fri, 18 Jan 2013 17:07:45 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59474#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - fedora 18 X server crashes after boot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59474">bug 59474</a>
              from <span class="vcard"><a class="email" href="mailto:dax&#64;enst.fr" title="Philippe Dax &lt;dax&#64;enst.fr&gt;"> <span class="fn">Philippe Dax</span></a>
</span></b>
        <pre>I suspect a missing driver :

$ yum list |grep xorg-x11-drv
xorg-x11-drv-apm.x86_64                1.2.5-2.fc18                    fedora   
xorg-x11-drv-ast.x86_64                0.97.0-2.fc18                   fedora   
xorg-x11-drv-ati.x86_64                7.0.0-0.8.20121015gitbd9e2c064.fc18
xorg-x11-drv-catalyst.x86_64           12.11-0.3.beta11.fc18          
rpmfusion-nonfree
xorg-x11-drv-catalyst-devel.i686       12.11-0.3.beta11.fc18          
rpmfusion-nonfree
xorg-x11-drv-catalyst-devel.x86_64     12.11-0.3.beta11.fc18          
rpmfusion-nonfree
xorg-x11-drv-catalyst-libs.i686        12.11-0.3.beta11.fc18          
rpmfusion-nonfree
xorg-x11-drv-catalyst-libs.x86_64      12.11-0.3.beta11.fc18          
rpmfusion-nonfree
xorg-x11-drv-cirrus.x86_64             1.5.1-3.fc18                    fedora   
xorg-x11-drv-dummy.x86_64              0.3.6-2.fc18                    fedora   
xorg-x11-drv-evdev.x86_64              2.7.3-2.fc18                    fedora   
xorg-x11-drv-evdev-devel.i686          2.7.3-2.fc18                    fedora   
xorg-x11-drv-evdev-devel.x86_64        2.7.3-2.fc18                    fedora   
xorg-x11-drv-fbdev.x86_64              0.4.3-3.fc18                    fedora   
xorg-x11-drv-glint.x86_64              1.2.8-2.fc18                    fedora   
xorg-x11-drv-i128.x86_64               1.3.6-2.fc18                    fedora   
xorg-x11-drv-i740.x86_64               1.3.4-2.fc18                    fedora   
xorg-x11-drv-intel.i686                2.20.17-1.fc18                  updates  
xorg-x11-drv-intel.x86_64              2.20.17-1.fc18                  updates  
xorg-x11-drv-intel-devel.i686          2.20.17-1.fc18                  updates  
xorg-x11-drv-intel-devel.x86_64        2.20.17-1.fc18                  updates  
xorg-x11-drv-ivtv.x86_64               1.2.0-0.1.fc18                  fedora   
xorg-x11-drv-keyboard.x86_64           1.6.2-3.fc18                    fedora   
xorg-x11-drv-mach64.x86_64             6.9.3-6.fc18                    fedora   
xorg-x11-drv-mga.x86_64                1.6.1-2.fc18                    fedora   
xorg-x11-drv-modesetting.x86_64        0.4.0-4.fc18                    fedora   
xorg-x11-drv-mouse.x86_64              1.8.1-3.fc18                    fedora   
xorg-x11-drv-mouse-devel.i686          1.8.1-3.fc18                    fedora   
xorg-x11-drv-mouse-devel.x86_64        1.8.1-3.fc18                    fedora   
xorg-x11-drv-nouveau.x86_64            1:1.0.3-1.fc18                  fedora   
xorg-x11-drv-nv.x86_64                 2.1.20-2.fc18                   fedora   
xorg-x11-drv-nvidia.x86_64             1:304.64-3.fc18                
rpmfusion-nonfree
xorg-x11-drv-nvidia-173xx.x86_64       173.14.36-1.fc18               
rpmfusion-nonfree
xorg-x11-drv-nvidia-173xx-devel.i686   173.14.36-1.fc18               
rpmfusion-nonfree
xorg-x11-drv-nvidia-173xx-devel.x86_64 173.14.36-1.fc18               
rpmfusion-nonfree
xorg-x11-drv-nvidia-173xx-libs.i686    173.14.36-1.fc18               
rpmfusion-nonfree
xorg-x11-drv-nvidia-173xx-libs.x86_64  173.14.36-1.fc18               
rpmfusion-nonfree
xorg-x11-drv-nvidia-devel.i686         1:304.64-3.fc18                
rpmfusion-nonfree
xorg-x11-drv-nvidia-devel.x86_64       1:304.64-3.fc18                
rpmfusion-nonfree
xorg-x11-drv-nvidia-libs.i686          1:304.64-3.fc18                
rpmfusion-nonfree
...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1358528865.1e02Dec1.29895--

--===============1814210326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1814210326==--
