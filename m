From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71900] [NV40] GPU lockup and segmentation fault of
 Nouveau-1.0.10 on PowerMac G5 with acceleration
Date: Sat, 23 Nov 2013 01:09:48 +0000
Message-ID: <bug-71900-8800-cUvoO74BUz@http.bugs.freedesktop.org/>
References: <bug-71900-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0551168065=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71900-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0551168065==
Content-Type: multipart/alternative; boundary="1385168987.0CF61.13772"; charset="us-ascii"


--1385168987.0CF61.13772
Date: Sat, 23 Nov 2013 01:09:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71900

--- Comment #7 from dehua.yang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Actually this is not HW acceleration by using ShadowFB. In Xorg.0.log there is
"Using Shadow Framebuffer - acceleration disabled", so I still have a broken
nouveau driver with acceleration. When using ShadowFB it seems the graphics
operations are faster than that NoAccel option is enabled on my system. The 3D
seems not supported, there is no difference in FPS running glxgears in both
situations.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1385168987.0CF61.13772
Date: Sat, 23 Nov 2013 01:09:47 +0000
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
   title="NEW --- - [NV40] GPU lockup and segmentation fault of Nouveau-1.0.10 on PowerMac G5 with acceleration"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71900#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV40] GPU lockup and segmentation fault of Nouveau-1.0.10 on PowerMac G5 with acceleration"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71900">bug 71900</a>
              from <span class="vcard"><a class="email" href="mailto:dehua.yang&#64;gmail.com" title="dehua.yang&#64;gmail.com">dehua.yang&#64;gmail.com</a>
</span></b>
        <pre>Actually this is not HW acceleration by using ShadowFB. In Xorg.0.log there is
&quot;Using Shadow Framebuffer - acceleration disabled&quot;, so I still have a broken
nouveau driver with acceleration. When using ShadowFB it seems the graphics
operations are faster than that NoAccel option is enabled on my system. The 3D
seems not supported, there is no difference in FPS running glxgears in both
situations.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1385168987.0CF61.13772--

--===============0551168065==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0551168065==--
