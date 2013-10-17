From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70135] [nv34 PowerMac G5] gnome-shell random crashes
 and rendering issues
Date: Thu, 17 Oct 2013 09:05:04 +0000
Message-ID: <bug-70135-8800-QXC7nPlkeZ@http.bugs.freedesktop.org/>
References: <bug-70135-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0641984184=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70135-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0641984184==
Content-Type: multipart/alternative; boundary="1382000704.ce2ea1.30609"; charset="us-ascii"


--1382000704.ce2ea1.30609
Date: Thu, 17 Oct 2013 09:05:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70135

--- Comment #17 from John Paul Adrian Glaubitz <glaubitz-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org> ---
Created attachment 87785
  --> https://bugs.freedesktop.org/attachment.cgi?id=87785&action=edit
glxinfo with LIBGL_DEBUG=verbose

Now with LIBGL_DEBUG=verbose.

Looks like X is unable to load the DRI drivers. In fact, the DRI modules in
Debian are not available in version 9.2.1 like the rest of Mesa but in version
9.1.6 only.

Am I right that the version mismatch between the DRI modules and the rest of
Mesa is the reason why 3D acceleration is not working?

I have upgraded the kernel to 3.11-rc7 in the meantime, btw.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1382000704.ce2ea1.30609
Date: Thu, 17 Oct 2013 09:05:04 +0000
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
   title="NEW --- - [nv34 PowerMac G5] gnome-shell random crashes and rendering issues"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70135#c17">Comment # 17</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nv34 PowerMac G5] gnome-shell random crashes and rendering issues"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70135">bug 70135</a>
              from <span class="vcard"><a class="email" href="mailto:glaubitz&#64;physik.fu-berlin.de" title="John Paul Adrian Glaubitz &lt;glaubitz&#64;physik.fu-berlin.de&gt;"> <span class="fn">John Paul Adrian Glaubitz</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=87785" name="attach_87785" title="glxinfo with LIBGL_DEBUG=verbose">attachment 87785</a> <a href="attachment.cgi?id=87785&amp;action=edit" title="glxinfo with LIBGL_DEBUG=verbose">[details]</a></span>
glxinfo with LIBGL_DEBUG=verbose

Now with LIBGL_DEBUG=verbose.

Looks like X is unable to load the DRI drivers. In fact, the DRI modules in
Debian are not available in version 9.2.1 like the rest of Mesa but in version
9.1.6 only.

Am I right that the version mismatch between the DRI modules and the rest of
Mesa is the reason why 3D acceleration is not working?

I have upgraded the kernel to 3.11-rc7 in the meantime, btw.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1382000704.ce2ea1.30609--

--===============0641984184==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0641984184==--
