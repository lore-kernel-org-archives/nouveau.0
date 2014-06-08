From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79795] [NVD9] No devices detected
Date: Sun, 08 Jun 2014 14:51:20 +0000
Message-ID: <bug-79795-8800-sq7kvcidxa@http.bugs.freedesktop.org/>
References: <bug-79795-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0733058997=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-79795-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0733058997==
Content-Type: multipart/alternative; boundary="1402239080.5BB6Cd862.30310"; charset="us-ascii"


--1402239080.5BB6Cd862.30310
Date: Sun, 8 Jun 2014 14:51:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79795

--- Comment #4 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Should be fixed with
commit adbbdbac04f093c0abf946b1e93e4e5291808491
Author: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Wed Mar 26 14:09:37 2014 +1000

    drm/nouveau: fail runtime pm properly.

    If we were on a non-optimus device, we'd return -EINVAL, this would
    lead to the over engineered runtime pm system to go into an error
    state, subsequent get_sync's would fail, so we'd never be able
    to open the device again.

    (like really get_sync shouldn't fail if the device isn't powered
    down).

    Signed-off-by: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
    Reviewed-by: Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>

which went in 3.14.0-rc8.

Feel free to forward it to stable if it resolves the problem for you.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1402239080.5BB6Cd862.30310
Date: Sun, 8 Jun 2014 14:51:19 +0000
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
   title="NEW --- - [NVD9] No devices detected"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79795#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVD9] No devices detected"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79795">bug 79795</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Should be fixed with
commit adbbdbac04f093c0abf946b1e93e4e5291808491
Author: Dave Airlie &lt;<a href="mailto:airlied&#64;redhat.com">airlied&#64;redhat.com</a>&gt;
Date:   Wed Mar 26 14:09:37 2014 +1000

    drm/nouveau: fail runtime pm properly.

    If we were on a non-optimus device, we'd return -EINVAL, this would
    lead to the over engineered runtime pm system to go into an error
    state, subsequent get_sync's would fail, so we'd never be able
    to open the device again.

    (like really get_sync shouldn't fail if the device isn't powered
    down).

    Signed-off-by: Dave Airlie &lt;<a href="mailto:airlied&#64;redhat.com">airlied&#64;redhat.com</a>&gt;
    Reviewed-by: Alex Deucher &lt;<a href="mailto:alexander.deucher&#64;amd.com">alexander.deucher&#64;amd.com</a>&gt;

which went in 3.14.0-rc8.

Feel free to forward it to stable if it resolves the problem for you.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1402239080.5BB6Cd862.30310--

--===============0733058997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0733058997==--
