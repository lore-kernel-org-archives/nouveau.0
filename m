From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 47556] [NV17] nouveau fails to handle/set
 resolutions over certain size, nouveau_bo_new() -ENOMEM
Date: Wed, 16 Oct 2013 17:49:07 +0000
Message-ID: <bug-47556-8800-78Yi0mkXhJ@http.bugs.freedesktop.org/>
References: <bug-47556-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0629677698=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-47556-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0629677698==
Content-Type: multipart/alternative; boundary="1381945747.fEd2210d2.12847"; charset="us-ascii"


--1381945747.fEd2210d2.12847
Date: Wed, 16 Oct 2013 17:49:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=47556

Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|[NV17] nouveau driver can't |[NV17] nouveau fails to
                   |handle xrandr requests      |handle/set resolutions over
                   |                            |certain size,
                   |                            |nouveau_bo_new() -ENOMEM

--- Comment #19 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Almost the same issue as originally, short on memory :'(

I admit some work on optimising such cases for low (gpu/vram) memory may be
needed, but I do not think it high up the priority list. Read - it's a most
likely a gem/ttm work than nouveau specific. Either way anyone is welcome to
give it a crack

Following the messages from xorg.log

drmmode_crtc_shadow_allocate >
nouveau_allocate_surface >
(libdrm) nouveau_bo_new >
(most likely) drmCommandWriteRead(dev->fd, DRM_NOUVEAU_GEM_NEW...) >
(kernel) nouveau_gem_ioctl_new >
(most likely) nouveau_gem_new >
chaos x)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381945747.fEd2210d2.12847
Date: Wed, 16 Oct 2013 17:49:07 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV17] nouveau fails to handle/set resolutions over certain size, nouveau_bo_new() -ENOMEM"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=47556">bug 47556</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>[NV17] nouveau driver can't handle xrandr requests
           </td>
           <td>[NV17] nouveau fails to handle/set resolutions over certain size, nouveau_bo_new() -ENOMEM
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV17] nouveau fails to handle/set resolutions over certain size, nouveau_bo_new() -ENOMEM"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=47556#c19">Comment # 19</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV17] nouveau fails to handle/set resolutions over certain size, nouveau_bo_new() -ENOMEM"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=47556">bug 47556</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Almost the same issue as originally, short on memory :'(

I admit some work on optimising such cases for low (gpu/vram) memory may be
needed, but I do not think it high up the priority list. Read - it's a most
likely a gem/ttm work than nouveau specific. Either way anyone is welcome to
give it a crack

Following the messages from xorg.log

drmmode_crtc_shadow_allocate &gt;
nouveau_allocate_surface &gt;
(libdrm) nouveau_bo_new &gt;
(most likely) drmCommandWriteRead(dev-&gt;fd, DRM_NOUVEAU_GEM_NEW...) &gt;
(kernel) nouveau_gem_ioctl_new &gt;
(most likely) nouveau_gem_new &gt;
chaos x)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381945747.fEd2210d2.12847--

--===============0629677698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0629677698==--
