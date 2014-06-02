From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79522] [NV67] Possible Regression 3.14.4+
Date: Mon, 02 Jun 2014 03:28:23 +0000
Message-ID: <bug-79522-8800-nRMG9jrxQL@http.bugs.freedesktop.org/>
References: <bug-79522-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1761161703=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-79522-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1761161703==
Content-Type: multipart/alternative; boundary="1401679702.bb6cEDd21.29597"; charset="us-ascii"


--1401679702.bb6cEDd21.29597
Date: Mon, 2 Jun 2014 03:28:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79522

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Do I understand correctly that v3.14.3 works but v3.14.4 doesn't? If so, that's
rather odd, since no drm changes went in between those two versions. If not,
can you be more explicit about what the last working version was? You might
need to do a bisect. Another thing to try is to turn off MSI (boot with
nouveau.config=NvMSI=0).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1401679702.bb6cEDd21.29597
Date: Mon, 2 Jun 2014 03:28:22 +0000
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
   title="NEW --- - [NV67] Possible Regression 3.14.4+"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79522#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV67] Possible Regression 3.14.4+"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79522">bug 79522</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Do I understand correctly that v3.14.3 works but v3.14.4 doesn't? If so, that's
rather odd, since no drm changes went in between those two versions. If not,
can you be more explicit about what the last working version was? You might
need to do a bisect. Another thing to try is to turn off MSI (boot with
nouveau.config=NvMSI=0).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1401679702.bb6cEDd21.29597--

--===============1761161703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1761161703==--
