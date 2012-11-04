From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 48090] Spam of system log with EDID messages
Date: Sun, 04 Nov 2012 16:52:33 +0000
Message-ID: <bug-48090-8800-LsLYMol2qZ@http.bugs.freedesktop.org/>
References: <bug-48090-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0849503897=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-48090-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0849503897==
Content-Type: multipart/alternative; boundary="1352047953.044c12.29731"; charset="us-ascii"


--1352047953.044c12.29731
Date: Sun, 4 Nov 2012 16:52:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=48090

--- Comment #4 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
You're welcome, can you let me know are you loading the edid from
file/firmware?

And here is a bit of background about edid(s)

The edid has header (block 0) and extensions (block 1-...), each 128 bytes in
size

drm core tries to retrieve the whole edid, thus in your case is failing to
fetch extension #1 (block 1).

Can you do the following
* attach the edid retrieved from both the blob and nouveau
* clearly indicate which one is which

I assume the file attached was fetched with the blob running

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1352047953.044c12.29731
Date: Sun, 4 Nov 2012 16:52:33 +0000
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
          bz_status_NEEDINFO "
   title="NEEDINFO --- - Spam of system log with EDID messages"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=48090#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - Spam of system log with EDID messages"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=48090">bug 48090</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>You're welcome, can you let me know are you loading the edid from
file/firmware?

And here is a bit of background about edid(s)

The edid has header (block 0) and extensions (block 1-...), each 128 bytes in
size

drm core tries to retrieve the whole edid, thus in your case is failing to
fetch extension #1 (block 1).

Can you do the following
* attach the edid retrieved from both the blob and nouveau
* clearly indicate which one is which

I assume the file attached was fetched with the blob running</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1352047953.044c12.29731--

--===============0849503897==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0849503897==--
