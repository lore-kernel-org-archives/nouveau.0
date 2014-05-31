From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74062] [NVE4] Artifacts in 3D games.
Date: Sat, 31 May 2014 18:47:32 +0000
Message-ID: <bug-74062-8800-4q6FE6D0Es@http.bugs.freedesktop.org/>
References: <bug-74062-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0960702005=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74062-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0960702005==
Content-Type: multipart/alternative; boundary="1401562051.BdCfE7bB0.4250"; charset="us-ascii"


--1401562051.BdCfE7bB0.4250
Date: Sat, 31 May 2014 18:47:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74062

--- Comment #13 from Mario Barrera <mbarrera-KK0ffGbhmjU@public.gmane.org> ---
(In reply to comment #12)
> Wild guess - perhaps it's LTCG related ?
> 
> You can easily check if that's the case my setting compressed = false in
> nvc0_miptree.c:nvc0_miptree_create.

Seems like, I just did what you suggested and all artifacts are gone now (just
had to restart any OpenGL program after installing). So I confirm this
workaround works for me.
Thanks Emil.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1401562051.BdCfE7bB0.4250
Date: Sat, 31 May 2014 18:47:31 +0000
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
   title="NEW --- - [NVE4] Artifacts in 3D games."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74062#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE4] Artifacts in 3D games."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74062">bug 74062</a>
              from <span class="vcard"><a class="email" href="mailto:mbarrera&#64;gmx.com" title="Mario Barrera &lt;mbarrera&#64;gmx.com&gt;"> <span class="fn">Mario Barrera</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=74062#c12">comment #12</a>)
<span class="quote">&gt; Wild guess - perhaps it's LTCG related ?
&gt; 
&gt; You can easily check if that's the case my setting compressed = false in
&gt; nvc0_miptree.c:nvc0_miptree_create.</span >

Seems like, I just did what you suggested and all artifacts are gone now (just
had to restart any OpenGL program after installing). So I confirm this
workaround works for me.
Thanks Emil.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1401562051.BdCfE7bB0.4250--

--===============0960702005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0960702005==--
