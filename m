From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71172] Segfault when running glxinfo. NV25GL
	[Quadro4 900 XGL]
Date: Mon, 04 Nov 2013 03:33:16 +0000
Message-ID: <bug-71172-8800-sNhdfgPy8S@http.bugs.freedesktop.org/>
References: <bug-71172-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0495648174=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71172-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0495648174==
Content-Type: multipart/alternative; boundary="1383535996.de1b1e0.22791"; charset="us-ascii"


--1383535996.de1b1e0.22791
Date: Mon, 4 Nov 2013 03:33:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71172

--- Comment #4 from Simon <simon-wM4F9T/ekXmXDw4h08c5KA@public.gmane.org> ---
Created attachment 88585
  --> https://bugs.freedesktop.org/attachment.cgi?id=88585&action=edit
output from working glxinfo

I'm not set up with the git sources, but managed to muddle-through with
building via the package system....
--
$ apt-get source libgl1-mesa-dri
$ sudo apt-get build-dep libgl1-mesa-dri
$ cd mesa-10.0~git1310311233.b16b3c~gd~s/
$ dpkg-buildpackage -b
--

After patching the file and installing the newly built package I was able to
run glxinfo without segfault. So that looks to be the problem solved.
--
$ sudo dpkg --install libgl1-mesa-dri_10.0~git1310311233.b16b3c~gd~s_i386.deb
libgl1-mesa-dri-dbg_10.0~git1310311233.b16b3c~gd~s_i386.deb
--

Thanks,
Simon.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1383535996.de1b1e0.22791
Date: Mon, 4 Nov 2013 03:33:16 +0000
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
   title="NEW --- - Segfault when running glxinfo. NV25GL [Quadro4 900 XGL]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71172#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Segfault when running glxinfo. NV25GL [Quadro4 900 XGL]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71172">bug 71172</a>
              from <span class="vcard"><a class="email" href="mailto:simon&#64;mungewell.org" title="Simon &lt;simon&#64;mungewell.org&gt;"> <span class="fn">Simon</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=88585" name="attach_88585" title="output from working glxinfo">attachment 88585</a> <a href="attachment.cgi?id=88585&amp;action=edit" title="output from working glxinfo">[details]</a></span>
output from working glxinfo

I'm not set up with the git sources, but managed to muddle-through with
building via the package system....
--
$ apt-get source libgl1-mesa-dri
$ sudo apt-get build-dep libgl1-mesa-dri
$ cd mesa-10.0~git1310311233.b16b3c~gd~s/
$ dpkg-buildpackage -b
--

After patching the file and installing the newly built package I was able to
run glxinfo without segfault. So that looks to be the problem solved.
--
$ sudo dpkg --install libgl1-mesa-dri_10.0~git1310311233.b16b3c~gd~s_i386.deb
libgl1-mesa-dri-dbg_10.0~git1310311233.b16b3c~gd~s_i386.deb
--

Thanks,
Simon.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1383535996.de1b1e0.22791--

--===============0495648174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0495648174==--
