From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23223] [NV4B] nVidia Geforce 7300 fails to properly
	resume
Date: Tue, 08 Jan 2013 09:00:34 +0000
Message-ID: <bug-23223-8800-nJbL2uSB1f@http.bugs.freedesktop.org/>
References: <bug-23223-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2005789734=="
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


--===============2005789734==
Content-Type: multipart/alternative; boundary="1357635634.a4d0F1.2371"; charset="us-ascii"


--1357635634.a4d0F1.2371
Date: Tue, 8 Jan 2013 09:00:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=23223

--- Comment #24 from Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Yes it worked out properly. The difference was that udev is started if I use
init and seems to change something with my display. If I then do an s2disk
cycle, everything is peachy and the mmiotrace is 30MB.

I started in single mode and started udev as well, I got the same result. Sorry
for bothering you, thought it was a driver issue. At least I can confirm that
the above mmiotrace should be okay for use.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1357635634.a4d0F1.2371
Date: Tue, 8 Jan 2013 09:00:34 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=23223#c24">Comment # 24</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV4B] nVidia Geforce 7300 fails to properly resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=23223">bug 23223</a>
              from <span class="vcard"><a class="email" href="mailto:ronald645&#64;gmail.com" title="Ronald &lt;ronald645&#64;gmail.com&gt;"> <span class="fn">Ronald</span></a>
</span></b>
        <pre>Yes it worked out properly. The difference was that udev is started if I use
init and seems to change something with my display. If I then do an s2disk
cycle, everything is peachy and the mmiotrace is 30MB.

I started in single mode and started udev as well, I got the same result. Sorry
for bothering you, thought it was a driver issue. At least I can confirm that
the above mmiotrace should be okay for use.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1357635634.a4d0F1.2371--

--===============2005789734==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2005789734==--
