From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67051] No nouveau HDMI sound on NVIDIA GT430
Date: Fri, 19 Jul 2013 21:15:55 +0000
Message-ID: <bug-67051-8800-rsmdXhD5oO@http.bugs.freedesktop.org/>
References: <bug-67051-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1113003530=="
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


--===============1113003530==
Content-Type: multipart/alternative; boundary="1374268555.eBd68FFC1.14125"; charset="us-ascii"


--1374268555.eBd68FFC1.14125
Date: Fri, 19 Jul 2013 21:15:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67051

--- Comment #24 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Oh wait, interesting, I misread one of your comments.

So with hdmi-1.patch, you *do* get the correct eld data. But still no sound,
even with the hdminva3 file patched up as well. So I was right... but not
enough.

Forget the bisect, it probably won't tell me anything, sorry about that.

Please test out the following things:

(a) does f7960736d0b8647fd149687d15deb79e47122d69 work fine?
(b) does a4feaf4ea5359db96a253154eafca358d16152b2 break?
(c) does a4feaf4ea5359db96a253154eafca358d16152b2 + hdmi-1.patch work fine?
(d) does 8e9e3d2deacc460fbb8a4691140318f6e85e6891 + hdmi-1.patch + hdminva3
patch work fine?

[no need to try other patch combinations, these are the ones to test]

You'll obviously need a linux git tree for this. I'm very curious to hear the
answers. If you hit a "no" on one, no need to do the "later" questions (e.g. if
(a) doesn't work, no need to do b/c/d).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374268555.eBd68FFC1.14125
Date: Fri, 19 Jul 2013 21:15:55 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051#c24">Comment # 24</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051">bug 67051</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Oh wait, interesting, I misread one of your comments.

So with hdmi-1.patch, you *do* get the correct eld data. But still no sound,
even with the hdminva3 file patched up as well. So I was right... but not
enough.

Forget the bisect, it probably won't tell me anything, sorry about that.

Please test out the following things:

(a) does f7960736d0b8647fd149687d15deb79e47122d69 work fine?
(b) does a4feaf4ea5359db96a253154eafca358d16152b2 break?
(c) does a4feaf4ea5359db96a253154eafca358d16152b2 + hdmi-1.patch work fine?
(d) does 8e9e3d2deacc460fbb8a4691140318f6e85e6891 + hdmi-1.patch + hdminva3
patch work fine?

[no need to try other patch combinations, these are the ones to test]

You'll obviously need a linux git tree for this. I'm very curious to hear the
answers. If you hit a &quot;no&quot; on one, no need to do the &quot;later&quot; questions (e.g. if
(a) doesn't work, no need to do b/c/d).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374268555.eBd68FFC1.14125--

--===============1113003530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1113003530==--
