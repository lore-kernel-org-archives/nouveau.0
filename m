From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 32341] nouveau only reads half the EDID.
Date: Sun, 04 Nov 2012 18:05:21 +0000
Message-ID: <bug-32341-8800-NpxyrJV3Zi@http.bugs.freedesktop.org/>
References: <bug-32341-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1472570621=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-32341-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1472570621==
Content-Type: multipart/alternative; boundary="1352052321.14FbDa662.12299"; charset="us-ascii"


--1352052321.14FbDa662.12299
Date: Sun, 4 Nov 2012 18:05:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=32341

--- Comment #1 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 69526
  --> https://bugs.freedesktop.org/attachment.cgi?id=69526&action=edit
Make the server aware when the edid is larger than 128 bytes

Ever since nouveau has done KMS only, it has been using the drm core to fetch
the edid.

With the patch attached, xrandr & X print the complete edid rather than just
the first block (the header)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1352052321.14FbDa662.12299
Date: Sun, 4 Nov 2012 18:05:21 +0000
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
   title="NEW --- - nouveau only reads half the EDID."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=32341#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau only reads half the EDID."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=32341">bug 32341</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=69526" name="attach_69526" title="Make the server aware when the edid is larger than 128 bytes">attachment 69526</a> <a href="attachment.cgi?id=69526&amp;action=edit" title="Make the server aware when the edid is larger than 128 bytes">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=32341&amp;attachment=69526'>[review]</a>
Make the server aware when the edid is larger than 128 bytes

Ever since nouveau has done KMS only, it has been using the drm core to fetch
the edid.

With the patch attached, xrandr &amp; X print the complete edid rather than just
the first block (the header)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1352052321.14FbDa662.12299--

--===============1472570621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1472570621==--
