From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67051] No nouveau HDMI sound on NVIDIA GT430
Date: Fri, 19 Jul 2013 22:35:23 +0000
Message-ID: <bug-67051-8800-XO5d6H5LQc@http.bugs.freedesktop.org/>
References: <bug-67051-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1267348346=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67051-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1267348346==
Content-Type: multipart/alternative; boundary="1374273323.Ec5dE1.23381"; charset="us-ascii"


--1374273323.Ec5dE1.23381
Date: Fri, 19 Jul 2013 22:35:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67051

--- Comment #26 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #25)
> Hi Ilia,
> 
> I was once bisecting left and right.  Not in the past two years or so.
> I can be back in shape relatively easy (I suppose) but it would obviously
> save me
> a lot of time and effort if you can give me some quick, clear and precise
> instructions, including
> 
> 1.  Version to stay on (3.7.10, 3.8.0, 3.10.1 - I have them ready)
> 2.  If on 3.10.1 (my guess), which of the three patches should be on exactly

None of the above, you'll need a git tree. Whenever you see a version like
a.b.c with c != 0, it's not a "clean" version but one that contains backported
patches.

> 3.  How to get a good copy of the tree to work on locally

git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

> 4.  How do I get to those commits (say,
> f7960736d0b8647fd149687d15deb79e47122d69)

cd linux
git checkout f7960736d0b8647fd149687d15deb79e47122d69

> 5.  (a) and (b):  what patches (if any)

None. It's a shortcut to the bisect, the two commits are sequential, and my
guess is that that's where things break. If I'm wrong, I'll have you do the
full bisect. Unfortunately both of the commits in (c) and (d) have known
defects, which is what the patches are for. It sounds like those patches are
incomplete, and I need to know which commit has left-over defects.

So basically you need to do

git checkout f7960736d0b8647fd149687d15deb79e47122d69
<build, test, make sure it works>

git checkout a4feaf4ea5359db96a253154eafca358d16152b2
<build, test, make sure it doesn't work>

<apply hdmi-1.patch>
<build, test, make sure it works>

git checkout 8e9e3d2deacc460fbb8a4691140318f6e85e6891
<verify that the hdmi-1.patch is still applied, if not, apply it>
<apply hdminva3.patch>
<build, test, see whether it works or not>

When testing whether things work, please record both whether you see the
correct data in eld, as well as whether sound plays.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374273323.Ec5dE1.23381
Date: Fri, 19 Jul 2013 22:35:23 +0000
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
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051#c26">Comment # 26</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051">bug 67051</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=67051#c25">comment #25</a>)
<span class="quote">&gt; Hi Ilia,
&gt; 
&gt; I was once bisecting left and right.  Not in the past two years or so.
&gt; I can be back in shape relatively easy (I suppose) but it would obviously
&gt; save me
&gt; a lot of time and effort if you can give me some quick, clear and precise
&gt; instructions, including
&gt; 
&gt; 1.  Version to stay on (3.7.10, 3.8.0, 3.10.1 - I have them ready)
&gt; 2.  If on 3.10.1 (my guess), which of the three patches should be on exactly</span >

None of the above, you'll need a git tree. Whenever you see a version like
a.b.c with c != 0, it's not a &quot;clean&quot; version but one that contains backported
patches.

<span class="quote">&gt; 3.  How to get a good copy of the tree to work on locally</span >

git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

<span class="quote">&gt; 4.  How do I get to those commits (say,
&gt; f7960736d0b8647fd149687d15deb79e47122d69)</span >

cd linux
git checkout f7960736d0b8647fd149687d15deb79e47122d69

<span class="quote">&gt; 5.  (a) and (b):  what patches (if any)</span >

None. It's a shortcut to the bisect, the two commits are sequential, and my
guess is that that's where things break. If I'm wrong, I'll have you do the
full bisect. Unfortunately both of the commits in (c) and (d) have known
defects, which is what the patches are for. It sounds like those patches are
incomplete, and I need to know which commit has left-over defects.

So basically you need to do

git checkout f7960736d0b8647fd149687d15deb79e47122d69
&lt;build, test, make sure it works&gt;

git checkout a4feaf4ea5359db96a253154eafca358d16152b2
&lt;build, test, make sure it doesn't work&gt;

&lt;apply hdmi-1.patch&gt;
&lt;build, test, make sure it works&gt;

git checkout 8e9e3d2deacc460fbb8a4691140318f6e85e6891
&lt;verify that the hdmi-1.patch is still applied, if not, apply it&gt;
&lt;apply hdminva3.patch&gt;
&lt;build, test, see whether it works or not&gt;

When testing whether things work, please record both whether you see the
correct data in eld, as well as whether sound plays.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374273323.Ec5dE1.23381--

--===============1267348346==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1267348346==--
