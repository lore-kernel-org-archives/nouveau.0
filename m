From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 81485] [NVE4] dmesg spam on startup
Date: Fri, 18 Jul 2014 17:29:12 +0000
Message-ID: <bug-81485-8800-HH7fV8N0iZ@http.bugs.freedesktop.org/>
References: <bug-81485-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1396047600=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-81485-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1396047600==
Content-Type: multipart/alternative; boundary="1405704552.51ABc2.26239"; charset="us-ascii"


--1405704552.51ABc2.26239
Date: Fri, 18 Jul 2014 17:29:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=81485

--- Comment #4 from Konstantin Svist <fry.kun-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 103053
  --> https://bugs.freedesktop.org/attachment.cgi?id=103053&action=edit
/var/log/messages from 3.15.5-200.fc20.x86_64

attaching a trimmed version from 3.15.5-200.fc20.x86_64
I've grepped out the majority of the same message, though the file is still
2.7M uncompressed

Just running "dmesg" gives me a few seconds of the spam; everything else is
gone already.

Will try a build from
http://koji.fedoraproject.org/koji/buildinfo?buildID=545032 later today.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1405704552.51ABc2.26239
Date: Fri, 18 Jul 2014 17:29:12 +0000
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
   title="NEW --- - [NVE4] dmesg spam on startup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81485#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE4] dmesg spam on startup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81485">bug 81485</a>
              from <span class="vcard"><a class="email" href="mailto:fry.kun&#64;gmail.com" title="Konstantin Svist &lt;fry.kun&#64;gmail.com&gt;"> <span class="fn">Konstantin Svist</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=103053" name="attach_103053" title="/var/log/messages from 3.15.5-200.fc20.x86_64">attachment 103053</a> <a href="attachment.cgi?id=103053&amp;action=edit" title="/var/log/messages from 3.15.5-200.fc20.x86_64">[details]</a></span>
/var/log/messages from 3.15.5-200.fc20.x86_64

attaching a trimmed version from 3.15.5-200.fc20.x86_64
I've grepped out the majority of the same message, though the file is still
2.7M uncompressed

Just running &quot;dmesg&quot; gives me a few seconds of the spam; everything else is
gone already.

Will try a build from
<a href="http://koji.fedoraproject.org/koji/buildinfo?buildID=545032">http://koji.fedoraproject.org/koji/buildinfo?buildID=545032</a> later today.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1405704552.51ABc2.26239--

--===============1396047600==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1396047600==--
