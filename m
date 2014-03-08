From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58556] MacBook Pro 5, 1 with nVidia 9400m and 9600m,
 scrambled screen
Date: Sat, 08 Mar 2014 23:39:11 +0000
Message-ID: <bug-58556-8800-WdVZa72J2O@http.bugs.freedesktop.org/>
References: <bug-58556-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0168373657=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58556-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0168373657==
Content-Type: multipart/alternative; boundary="1394321951.37acD5.5498"; charset="us-ascii"


--1394321951.37acD5.5498
Date: Sat, 8 Mar 2014 23:39:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58556

--- Comment #26 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
Hi Joanand,

Shouldn't the patch for driver/gpu/drm/nouveau/core/subdev/bar/nv50.c rather be
+ line 233: int ret, i;
+ line 351: for(i = 0; i < 8; i++)
+ line 352: nv_wr32(priv, 0x001900 + (i * 4), 0x00000000);
By the way, on top of which commit/kernel are you applying the patch?

Yeah, if you try with acceleration you end up with bug 27501
(https://bugs.freedesktop.org/show_bug.cgi?id=27501).

EFIFB should not be the problem: it is removed by nouveau at some point, to be
replaced by nouveaufb, which seems to be not rightly configured (or the
accesses to it), bringing screen corruption.

I have a 5,3 (iirc) MacBook Pro (mid 2009) 15.6", with the same graphic cards,
resolution is also 1440x900.

Pierre

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1394321951.37acD5.5498
Date: Sat, 8 Mar 2014 23:39:11 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - MacBook Pro 5,1 with nVidia 9400m and 9600m, scrambled screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58556#c26">Comment # 26</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - MacBook Pro 5,1 with nVidia 9400m and 9600m, scrambled screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58556">bug 58556</a>
              from <span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span></b>
        <pre>Hi Joanand,

Shouldn't the patch for driver/gpu/drm/nouveau/core/subdev/bar/nv50.c rather be
+ line 233: int ret, i;
+ line 351: for(i = 0; i &lt; 8; i++)
+ line 352: nv_wr32(priv, 0x001900 + (i * 4), 0x00000000);
By the way, on top of which commit/kernel are you applying the patch?

Yeah, if you try with acceleration you end up with <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - MacBook Pro 5,x unable to boot [NV96 + NVAC]"
   href="show_bug.cgi?id=27501">bug 27501</a>
(<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - MacBook Pro 5,x unable to boot [NV96 + NVAC]"
   href="show_bug.cgi?id=27501">https://bugs.freedesktop.org/show_bug.cgi?id=27501</a>).

EFIFB should not be the problem: it is removed by nouveau at some point, to be
replaced by nouveaufb, which seems to be not rightly configured (or the
accesses to it), bringing screen corruption.

I have a 5,3 (iirc) MacBook Pro (mid 2009) 15.6&quot;, with the same graphic cards,
resolution is also 1440x900.

Pierre</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1394321951.37acD5.5498--

--===============0168373657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0168373657==--
