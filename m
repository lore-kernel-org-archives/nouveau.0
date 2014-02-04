From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74492] v3.13-rc8 nv4e + msi = random lockups
Date: Tue, 04 Feb 2014 08:29:38 +0000
Message-ID: <bug-74492-8800-aijiQoMOtQ@http.bugs.freedesktop.org/>
References: <bug-74492-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1664524512=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74492-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1664524512==
Content-Type: multipart/alternative; boundary="1391502578.3c0EEB01.18720"; charset="us-ascii"


--1391502578.3c0EEB01.18720
Date: Tue, 4 Feb 2014 08:29:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74492

--- Comment #6 from Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 93345
  --> https://bugs.freedesktop.org/attachment.cgi?id=93345&action=edit
Logs directly after corruption in tty

I managed to reproduce it. I think it's reliable, but that will have to wait. I
have to go in 30 minutes.

I was able to reproduce it by scrolling like a madmen in tty2. It was just a
guess =) .

However, nouveau seems to be the quiet type:

[  122.487034] nouveau E[     DRM] GPU lockup - switching to software fbcon

log_msi=1.txt is the logs without corruption
corrupt.txt is the logs with corruption
log_msi=0.txt is a clean boot

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391502578.3c0EEB01.18720
Date: Tue, 4 Feb 2014 08:29:38 +0000
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
   title="NEW --- - v3.13-rc8 nv4e + msi = random lockups"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74492#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - v3.13-rc8 nv4e + msi = random lockups"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74492">bug 74492</a>
              from <span class="vcard"><a class="email" href="mailto:ronald645&#64;gmail.com" title="Ronald &lt;ronald645&#64;gmail.com&gt;"> <span class="fn">Ronald</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=93345" name="attach_93345" title="Logs directly after corruption in tty">attachment 93345</a> <a href="attachment.cgi?id=93345&amp;action=edit" title="Logs directly after corruption in tty">[details]</a></span>
Logs directly after corruption in tty

I managed to reproduce it. I think it's reliable, but that will have to wait. I
have to go in 30 minutes.

I was able to reproduce it by scrolling like a madmen in tty2. It was just a
guess =) .

However, nouveau seems to be the quiet type:

[  122.487034] nouveau E[     DRM] GPU lockup - switching to software fbcon

log_msi=1.txt is the logs without corruption
corrupt.txt is the logs with corruption
log_msi=0.txt is a clean boot</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391502578.3c0EEB01.18720--

--===============1664524512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1664524512==--
