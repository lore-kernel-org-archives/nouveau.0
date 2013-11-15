From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71659] [NVD9] Hangs under load with ![
 PFIFO][0000:01:00.0] unhandled status 0x00800000
Date: Fri, 15 Nov 2013 20:19:30 +0000
Message-ID: <bug-71659-8800-blNEMFXNP4@http.bugs.freedesktop.org/>
References: <bug-71659-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0444720660=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71659-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0444720660==
Content-Type: multipart/alternative; boundary="1384546770.d1FB8c1.32668"; charset="us-ascii"


--1384546770.d1FB8c1.32668
Date: Fri, 15 Nov 2013 20:19:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71659

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
There was a bug introduced in 3.11 (I think) for nvc1,nvd7,nvd9 which is fixed
by
http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=89ad841ffd3eccd06e2a12649f4a5028ecb973b7.
I'm not sure what the user-visible effect of the bug is, I suspect it depends
on a lot of local configuration settings. I don't know if this will help you,
but I believe it's worth trying.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1384546770.d1FB8c1.32668
Date: Fri, 15 Nov 2013 20:19:30 +0000
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
   title="NEW --- - [NVD9] Hangs under load with ![ PFIFO][0000:01:00.0] unhandled status 0x00800000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71659#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVD9] Hangs under load with ![ PFIFO][0000:01:00.0] unhandled status 0x00800000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71659">bug 71659</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>There was a bug introduced in 3.11 (I think) for nvc1,nvd7,nvd9 which is fixed
by
<a href="http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=89ad841ffd3eccd06e2a12649f4a5028ecb973b7">http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=89ad841ffd3eccd06e2a12649f4a5028ecb973b7</a>.
I'm not sure what the user-visible effect of the bug is, I suspect it depends
on a lot of local configuration settings. I don't know if this will help you,
but I believe it's worth trying.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1384546770.d1FB8c1.32668--

--===============0444720660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0444720660==--
