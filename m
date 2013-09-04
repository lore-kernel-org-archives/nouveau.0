From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 49727] [nv30 gallium] wine 1.5.2 and 3Dmark2001se
 displays only black screen with FPS, on nv43/AGP
Date: Wed, 04 Sep 2013 02:41:58 +0000
Message-ID: <bug-49727-8800-oU3czBUk35@http.bugs.freedesktop.org/>
References: <bug-49727-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1802754117=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-49727-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1802754117==
Content-Type: multipart/alternative; boundary="1378262518.Aa1d840b0.29436"; charset="us-ascii"


--1378262518.Aa1d840b0.29436
Date: Wed, 4 Sep 2013 02:41:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=49727

--- Comment #6 from Andrew Randrianasulu <randrik-JGs/UdohzUI@public.gmane.org> ---
(In reply to comment #5)
> Is this still an issue with mesa 9.1 or later?

Yes, using  those  versions of  software:

bash-4.2# glxinfo | grep git
OpenGL version string: 1.4 (2.1 Mesa 9.3.0-devel (git-6b5c802))
bash-4.2# wine  --version
wine-1.5.25-1-gc2505fd
bash-4.2# uname -a
Linux slax6 3.6.11-small #3 Wed Dec 19 03:52:52 GMT 2012 i686 Intel(R)
Celeron(TM) CPU                1000MHz GenuineIntel GNU/Linux

bug still here.

I  can't  test  newer kernels  due to bug 58615

I tested 3dmark WITHOUT LIBGL_ALWAYS_INDIRECT variable set, but right now it
was set for X session. (so, OpenGL 1.4 vs 2.1)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1378262518.Aa1d840b0.29436
Date: Wed, 4 Sep 2013 02:41:58 +0000
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
   title="NEW --- - [nv30 gallium] wine 1.5.2 and 3Dmark2001se displays only black screen with FPS, on nv43/AGP"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=49727#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nv30 gallium] wine 1.5.2 and 3Dmark2001se displays only black screen with FPS, on nv43/AGP"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=49727">bug 49727</a>
              from <span class="vcard"><a class="email" href="mailto:randrik&#64;mail.ru" title="Andrew Randrianasulu &lt;randrik&#64;mail.ru&gt;"> <span class="fn">Andrew Randrianasulu</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=49727#c5">comment #5</a>)
<span class="quote">&gt; Is this still an issue with mesa 9.1 or later?</span >

Yes, using  those  versions of  software:

bash-4.2# glxinfo | grep git
OpenGL version string: 1.4 (2.1 Mesa 9.3.0-devel (git-6b5c802))
bash-4.2# wine  --version
wine-1.5.25-1-gc2505fd
bash-4.2# uname -a
Linux slax6 3.6.11-small #3 Wed Dec 19 03:52:52 GMT 2012 i686 Intel(R)
Celeron(TM) CPU                1000MHz GenuineIntel GNU/Linux

bug still here.

I  can't  test  newer kernels  due to <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV43] hangs with direct rendering since 3.7 rework"
   href="show_bug.cgi?id=58615">bug 58615</a>

I tested 3dmark WITHOUT LIBGL_ALWAYS_INDIRECT variable set, but right now it
was set for X session. (so, OpenGL 1.4 vs 2.1)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1378262518.Aa1d840b0.29436--

--===============1802754117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1802754117==--
