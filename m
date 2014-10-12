From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27501] MacBook Pro 5, x unable to boot [NV96 + NVAC]
Date: Sun, 12 Oct 2014 13:05:45 +0000
Message-ID: <bug-27501-8800-dzZ4syiXUX@http.bugs.freedesktop.org/>
References: <bug-27501-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1593565957=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-27501-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1593565957==
Content-Type: multipart/alternative; boundary="1413119145.dB1F26.28879"; charset="UTF-8"


--1413119145.dB1F26.28879
Date: Sun, 12 Oct 2014 13:05:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=27501

--- Comment #49 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
(In reply to Ratchanan Srirattanamet from comment #48)
> Will Pierre Moreau's patch be merged? This patch fix acceleration on system
> with only 9400M too. Symptom is X can start but gets locked up when I run
> glxgears for a while. System is Ubuntu 14.10 with Linux 3.17 compiled from
> git. After apply this patch, the symptom disappear.

Hi Ratchanan,

My patch wasn't merged into 3.17 as it was a bit too short before the release,
plus it didn't had time to be properly tested on other machines to check if it
didn't introduce some regressions; I'll use the extra time to reverse-engineer
the registers I modify. However it should be able to go into 3.18 if
reverse-engineering goes well.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1413119145.dB1F26.28879
Date: Sun, 12 Oct 2014 13:05:45 +0000
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
   title="NEW - MacBook Pro 5,x unable to boot [NV96 + NVAC]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=27501#c49">Comment # 49</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - MacBook Pro 5,x unable to boot [NV96 + NVAC]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=27501">bug 27501</a>
              from <span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span></b>
        <pre>(In reply to Ratchanan Srirattanamet from <a href="show_bug.cgi?id=27501#c48">comment #48</a>)
<span class="quote">&gt; Will Pierre Moreau's patch be merged? This patch fix acceleration on system
&gt; with only 9400M too. Symptom is X can start but gets locked up when I run
&gt; glxgears for a while. System is Ubuntu 14.10 with Linux 3.17 compiled from
&gt; git. After apply this patch, the symptom disappear.</span >

Hi Ratchanan,

My patch wasn't merged into 3.17 as it was a bit too short before the release,
plus it didn't had time to be properly tested on other machines to check if it
didn't introduce some regressions; I'll use the extra time to reverse-engineer
the registers I modify. However it should be able to go into 3.18 if
reverse-engineering goes well.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1413119145.dB1F26.28879--

--===============1593565957==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1593565957==--
