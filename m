From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74195] [NVCE] Responsivity to input with vsync on is
 slower after update
Date: Wed, 29 Jan 2014 23:21:24 +0000
Message-ID: <bug-74195-8800-0nDX9JYxjW@http.bugs.freedesktop.org/>
References: <bug-74195-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0318949771=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74195-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0318949771==
Content-Type: multipart/alternative; boundary="1391037684.ca4a2.23751"; charset="us-ascii"


--1391037684.ca4a2.23751
Date: Wed, 29 Jan 2014 23:21:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74195

--- Comment #6 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Great catch Ilia,

from the DocBook [1]

Manual IRQ Registration
  ... They must set the
  <structname>drm_device</structname> <structfield>irq_enabled</structfield>
  field to 1 upon registration of the IRQs, and clear it to 0 after
  unregistering the IRQs.


[1]
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/DocBook/drm.tmpl#n374

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391037684.ca4a2.23751
Date: Wed, 29 Jan 2014 23:21:24 +0000
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
   title="NEW --- - [NVCE] Responsivity to input with vsync on is slower after update"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74195#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVCE] Responsivity to input with vsync on is slower after update"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74195">bug 74195</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Great catch Ilia,

from the DocBook [1]

Manual IRQ Registration
  ... They must set the
  &lt;structname&gt;drm_device&lt;/structname&gt; &lt;structfield&gt;irq_enabled&lt;/structfield&gt;
  field to 1 upon registration of the IRQs, and clear it to 0 after
  unregistering the IRQs.


[1]
<a href="https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/DocBook/drm.tmpl#n374">https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/DocBook/drm.tmpl#n374</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391037684.ca4a2.23751--

--===============0318949771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0318949771==--
