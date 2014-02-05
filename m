From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40747] [NV44] dual-link tmds no longer allowed
Date: Wed, 05 Feb 2014 04:38:29 +0000
Message-ID: <bug-40747-8800-eM2gOC8Gl1@http.bugs.freedesktop.org/>
References: <bug-40747-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1014082452=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-40747-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1014082452==
Content-Type: multipart/alternative; boundary="1391575109.eDeBA5.6315"; charset="us-ascii"


--1391575109.eDeBA5.6315
Date: Wed, 5 Feb 2014 04:38:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=40747

--- Comment #19 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
I might be misremembering about 1600x1200 working on my NV34 actually... maybe
it was 1680x1050 that worked. I just flipped it to VGA, which could handle
1920x1200 just fine. Here are my modes:

  1920x1200 (0x64)  154.0MHz +HSync -VSync *current +preferred
        h: width  1920 start 1968 end 2000 total 2080 skew    0 clock   74.0KHz
        v: height 1200 start 1203 end 1209 total 1235           clock   60.0Hz
  1600x1200 (0x65)  162.0MHz +HSync +VSync
        h: width  1600 start 1664 end 1856 total 2160 skew    0 clock   75.0KHz
        v: height 1200 start 1201 end 1204 total 1250           clock   60.0Hz
  1680x1050 (0x66)  119.0MHz +HSync -VSync
        h: width  1680 start 1728 end 1760 total 1840 skew    0 clock   64.7KHz
        v: height 1050 start 1053 end 1059 total 1080           clock   59.9Hz

Note how 1920x1200 is under the 155MHz limit of NV4x single-link TMDS chips.
(And the nv34 has a 135MHz limit, so it can't do 1920x1200 either.)

If this worked on the blob, I wonder if it was really using TMDS for outputting
the 1600x1200 resolution, and not using the VGA (which should be able to handle
it just fine). Still would be interesting to see what happens if you just make
it claim that you have dual-link -- could well be that the nouveau detection of
it is incorrect, or perhaps the TMDS on your card can do 165MHz and not 155MHz.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391575109.eDeBA5.6315
Date: Wed, 5 Feb 2014 04:38:29 +0000
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
   title="REOPENED --- - [NV44] dual-link tmds no longer allowed"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=40747#c19">Comment # 19</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NV44] dual-link tmds no longer allowed"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=40747">bug 40747</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>I might be misremembering about 1600x1200 working on my NV34 actually... maybe
it was 1680x1050 that worked. I just flipped it to VGA, which could handle
1920x1200 just fine. Here are my modes:

  1920x1200 (0x64)  154.0MHz +HSync -VSync *current +preferred
        h: width  1920 start 1968 end 2000 total 2080 skew    0 clock   74.0KHz
        v: height 1200 start 1203 end 1209 total 1235           clock   60.0Hz
  1600x1200 (0x65)  162.0MHz +HSync +VSync
        h: width  1600 start 1664 end 1856 total 2160 skew    0 clock   75.0KHz
        v: height 1200 start 1201 end 1204 total 1250           clock   60.0Hz
  1680x1050 (0x66)  119.0MHz +HSync -VSync
        h: width  1680 start 1728 end 1760 total 1840 skew    0 clock   64.7KHz
        v: height 1050 start 1053 end 1059 total 1080           clock   59.9Hz

Note how 1920x1200 is under the 155MHz limit of NV4x single-link TMDS chips.
(And the nv34 has a 135MHz limit, so it can't do 1920x1200 either.)

If this worked on the blob, I wonder if it was really using TMDS for outputting
the 1600x1200 resolution, and not using the VGA (which should be able to handle
it just fine). Still would be interesting to see what happens if you just make
it claim that you have dual-link -- could well be that the nouveau detection of
it is incorrect, or perhaps the TMDS on your card can do 165MHz and not 155MHz.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391575109.eDeBA5.6315--

--===============1014082452==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1014082452==--
