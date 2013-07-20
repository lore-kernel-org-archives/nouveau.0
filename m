From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67051] No nouveau HDMI sound on NVIDIA GT430
Date: Sat, 20 Jul 2013 03:02:25 +0000
Message-ID: <bug-67051-8800-B4bggJORqL@http.bugs.freedesktop.org/>
References: <bug-67051-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0511115848=="
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


--===============0511115848==
Content-Type: multipart/alternative; boundary="1374289345.67AD630.23295"; charset="us-ascii"


--1374289345.67AD630.23295
Date: Sat, 20 Jul 2013 03:02:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67051

--- Comment #27 from Alex <alupu01-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
# All versions are 3.7.0-rc4+
# Four builds, tests:

1.  f7960736d0b8647fd149687d15deb79e47122d69
     <build, test, make sure it works>

2.  a4feaf4ea5359db96a253154eafca358d16152b2
     <build, test, make sure it doesn't work>

3.  a4feaf4ea5359db96a253154eafca358d16152b2  <apply hdmi-1.patch>
     <build, test, make sure it works>

4.  8e9e3d2deacc460fbb8a4691140318f6e85e6891
     <verify that the hdmi-1.patch is still applied, if not, apply it>
     <apply hdminva3.patch>
     <build, test, see whether it works or not>

# Results (keyed to the numbers above):

     eld#3.0              HDMI sound
     =======              ==========
1.    Good                   Good

2.    Bad*                   Good (!)

3.    Good                   Good

4.    Good                   No sound


*
 monitor_present  1
 eld_valid        0

(!) = puzzled

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374289345.67AD630.23295
Date: Sat, 20 Jul 2013 03:02:25 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051#c27">Comment # 27</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051">bug 67051</a>
              from <span class="vcard"><a class="email" href="mailto:alupu01&#64;gmail.com" title="Alex &lt;alupu01&#64;gmail.com&gt;"> <span class="fn">Alex</span></a>
</span></b>
        <pre># All versions are 3.7.0-rc4+
# Four builds, tests:

1.  f7960736d0b8647fd149687d15deb79e47122d69
     &lt;build, test, make sure it works&gt;

2.  a4feaf4ea5359db96a253154eafca358d16152b2
     &lt;build, test, make sure it doesn't work&gt;

3.  a4feaf4ea5359db96a253154eafca358d16152b2  &lt;apply hdmi-1.patch&gt;
     &lt;build, test, make sure it works&gt;

4.  8e9e3d2deacc460fbb8a4691140318f6e85e6891
     &lt;verify that the hdmi-1.patch is still applied, if not, apply it&gt;
     &lt;apply hdminva3.patch&gt;
     &lt;build, test, see whether it works or not&gt;

# Results (keyed to the numbers above):

     eld#3.0              HDMI sound
     =======              ==========
1.    Good                   Good

2.    Bad*                   Good (!)

3.    Good                   Good

4.    Good                   No sound


*
 monitor_present  1
 eld_valid        0

(!) = puzzled</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374289345.67AD630.23295--

--===============0511115848==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0511115848==--
