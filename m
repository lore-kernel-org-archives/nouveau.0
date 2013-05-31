From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 62914] ZaphodHeads doesn't work after upgrading to
	xorg 1.14
Date: Fri, 31 May 2013 03:24:30 +0000
Message-ID: <bug-62914-8800-fLQmrgE0kb@http.bugs.freedesktop.org/>
References: <bug-62914-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0755784617=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-62914-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0755784617==
Content-Type: multipart/alternative; boundary="1369970670.dda6ddC1.18476"; charset="us-ascii"


--1369970670.dda6ddC1.18476
Date: Fri, 31 May 2013 03:24:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=62914

Jason Stubbs <jasonbstubbs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jasonbstubbs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #20 from Jason Stubbs <jasonbstubbs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi,

I was getting the "[drm] error opening the drm" error, which is what led me to
this bug, and d3b52efe solves it for me too. I think the crash is a different
error as the "error opening the drm" error existed even on 1.0.4 whereas that
version didn't have the crash.

Having said that, I'm getting the crash too and have got some of the
information you've asked for so. seeing it's already been discussed on this
bug, I'll go ahead and post it here.

git bisect led me to this commit:


commit 1fdd7db94b55c65ea62cc9eaefff620b20e9e4ea
Author: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Mon Jan 7 15:28:53 2013 +1000

    nouveau: add reverse prime support

    This allows the nvidia card to scanout Intel cards rendering.

    Signed-off-by: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>


It didn't revert cleanly against master and how to fix the conflict wasn't
clear to me so I haven't been able to test that.

The disassemble points to the function drmmode_set_mode_major. I'll attach that
output, along with my Xorg.0.log after this.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1369970670.dda6ddC1.18476
Date: Fri, 31 May 2013 03:24:30 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:jasonbstubbs&#64;gmail.com" title="Jason Stubbs &lt;jasonbstubbs&#64;gmail.com&gt;"> <span class="fn">Jason Stubbs</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - ZaphodHeads doesn't work after upgrading to xorg 1.14"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62914">bug 62914</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>jasonbstubbs&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - ZaphodHeads doesn't work after upgrading to xorg 1.14"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62914#c20">Comment # 20</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - ZaphodHeads doesn't work after upgrading to xorg 1.14"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62914">bug 62914</a>
              from <span class="vcard"><a class="email" href="mailto:jasonbstubbs&#64;gmail.com" title="Jason Stubbs &lt;jasonbstubbs&#64;gmail.com&gt;"> <span class="fn">Jason Stubbs</span></a>
</span></b>
        <pre>Hi,

I was getting the &quot;[drm] error opening the drm&quot; error, which is what led me to
this bug, and d3b52efe solves it for me too. I think the crash is a different
error as the &quot;error opening the drm&quot; error existed even on 1.0.4 whereas that
version didn't have the crash.

Having said that, I'm getting the crash too and have got some of the
information you've asked for so. seeing it's already been discussed on this
bug, I'll go ahead and post it here.

git bisect led me to this commit:


commit 1fdd7db94b55c65ea62cc9eaefff620b20e9e4ea
Author: Dave Airlie &lt;<a href="mailto:airlied&#64;redhat.com">airlied&#64;redhat.com</a>&gt;
Date:   Mon Jan 7 15:28:53 2013 +1000

    nouveau: add reverse prime support

    This allows the nvidia card to scanout Intel cards rendering.

    Signed-off-by: Dave Airlie &lt;<a href="mailto:airlied&#64;redhat.com">airlied&#64;redhat.com</a>&gt;


It didn't revert cleanly against master and how to fix the conflict wasn't
clear to me so I haven't been able to test that.

The disassemble points to the function drmmode_set_mode_major. I'll attach that
output, along with my Xorg.0.log after this.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1369970670.dda6ddC1.18476--

--===============0755784617==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0755784617==--
