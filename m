From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23223] [NV4B] nVidia Geforce 7300 fails to properly
	resume
Date: Tue, 08 Jan 2013 08:30:59 +0000
Message-ID: <bug-23223-8800-CYMmPsmrpt@http.bugs.freedesktop.org/>
References: <bug-23223-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0758036303=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-23223-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0758036303==
Content-Type: multipart/alternative; boundary="1357633859.32147011.31573"; charset="us-ascii"


--1357633859.32147011.31573
Date: Tue, 8 Jan 2013 08:30:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=23223

--- Comment #23 from Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 72669
  --> https://bugs.freedesktop.org/attachment.cgi?id=72669&action=edit
Mmiotrace of NV4B s2disk cycle, kernel v3.7.1 and nVidia 304.64

I think it worked out. Weird thing is: I tried booting with init=/bin/bash,
setting up the mounts myself and making root rw and all that. Then I get a
750kb uncompressed file. So I tried again, booting using Gentoo, but without X
and terminal only, and it's 30MB uncompressed.

What is the difference? I think it worked out okay though.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1357633859.32147011.31573
Date: Tue, 8 Jan 2013 08:30:59 +0000
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
   title="NEW --- - [NV4B] nVidia Geforce 7300 fails to properly resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=23223#c23">Comment # 23</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV4B] nVidia Geforce 7300 fails to properly resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=23223">bug 23223</a>
              from <span class="vcard"><a class="email" href="mailto:ronald645&#64;gmail.com" title="Ronald &lt;ronald645&#64;gmail.com&gt;"> <span class="fn">Ronald</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=72669" name="attach_72669" title="Mmiotrace of NV4B s2disk cycle, kernel v3.7.1 and nVidia 304.64">attachment 72669</a> <a href="attachment.cgi?id=72669&amp;action=edit" title="Mmiotrace of NV4B s2disk cycle, kernel v3.7.1 and nVidia 304.64">[details]</a></span>
Mmiotrace of NV4B s2disk cycle, kernel v3.7.1 and nVidia 304.64

I think it worked out. Weird thing is: I tried booting with init=/bin/bash,
setting up the mounts myself and making root rw and all that. Then I get a
750kb uncompressed file. So I tried again, booting using Gentoo, but without X
and terminal only, and it's 30MB uncompressed.

What is the difference? I think it worked out okay though.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1357633859.32147011.31573--

--===============0758036303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0758036303==--
