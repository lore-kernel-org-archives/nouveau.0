From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70511] nouveau_bo_name_get segmentation fault while
 running root tutorials/gl/glbox.C
Date: Sun, 13 Jul 2014 16:28:55 +0000
Message-ID: <bug-70511-8800-fzy12bDUiM@http.bugs.freedesktop.org/>
References: <bug-70511-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0554286040=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70511-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0554286040==
Content-Type: multipart/alternative; boundary="1405268935.8Df21.10098"; charset="us-ascii"


--1405268935.8Df21.10098
Date: Sun, 13 Jul 2014 16:28:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70511

--- Comment #1 from Vittorio <zeccav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I believe this situation comes from a NULL pointer in nouveau_dri2.c:246
"r = nouveau_bo_name_get(nouveau_pixmap_bo(pixmap), &front->name);"
because nouveau_pixmap_bo returns a NULL pointer and 
nouveau_bo_name_get dereferences it.
Should the caller update_front handle this one, 
or the called nouveau_bo_name_get?
This is from xf86-video-nouveau-1.0.9.
Many codes provoke this bug, as in /usr/lib64/mesa/teapot.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1405268935.8Df21.10098
Date: Sun, 13 Jul 2014 16:28:55 +0000
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
   title="NEW --- - nouveau_bo_name_get segmentation fault while running root tutorials/gl/glbox.C"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70511#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau_bo_name_get segmentation fault while running root tutorials/gl/glbox.C"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70511">bug 70511</a>
              from <span class="vcard"><a class="email" href="mailto:zeccav&#64;gmail.com" title="Vittorio &lt;zeccav&#64;gmail.com&gt;"> <span class="fn">Vittorio</span></a>
</span></b>
        <pre>I believe this situation comes from a NULL pointer in nouveau_dri2.c:246
&quot;r = nouveau_bo_name_get(nouveau_pixmap_bo(pixmap), &amp;front-&gt;name);&quot;
because nouveau_pixmap_bo returns a NULL pointer and 
nouveau_bo_name_get dereferences it.
Should the caller update_front handle this one, 
or the called nouveau_bo_name_get?
This is from xf86-video-nouveau-1.0.9.
Many codes provoke this bug, as in /usr/lib64/mesa/teapot.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1405268935.8Df21.10098--

--===============0554286040==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0554286040==--
