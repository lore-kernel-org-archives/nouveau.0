From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73358] [regression?][nv34] adobe flash + firefox ->
	DATA_ERROR
Date: Thu, 16 Jan 2014 21:13:57 +0000
Message-ID: <bug-73358-8800-t459jKWZ1Z@http.bugs.freedesktop.org/>
References: <bug-73358-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0590962152=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73358-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0590962152==
Content-Type: multipart/alternative; boundary="1389906837.DA612.2123"; charset="us-ascii"


--1389906837.DA612.2123
Date: Thu, 16 Jan 2014 21:13:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73358

--- Comment #17 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 92246
  --> https://bugs.freedesktop.org/attachment.cgi?id=92246&action=edit
printfs and bail

Ronald try this patch. Apply it on top of the mesa that you're using currently.

It will print the different formats, and bail when we try to program 0x0000120
to the card. This may cause side effects so do _not_ install, but rather
specify the location of the local/new nouveau_dri.so via the LIBGL_DRIVERS_PATH
variable.

ex.
LIBGL_DRIVERS_PATH=/home/emo/mesa/build/lib/gallium firefox >& fdo73358.log

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389906837.DA612.2123
Date: Thu, 16 Jan 2014 21:13:57 +0000
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
   title="NEW --- - [regression?][nv34] adobe flash + firefox -&gt; DATA_ERROR"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73358#c17">Comment # 17</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [regression?][nv34] adobe flash + firefox -&gt; DATA_ERROR"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73358">bug 73358</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=92246" name="attach_92246" title="printfs and bail">attachment 92246</a> <a href="attachment.cgi?id=92246&amp;action=edit" title="printfs and bail">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=73358&amp;attachment=92246'>[review]</a>
printfs and bail

Ronald try this patch. Apply it on top of the mesa that you're using currently.

It will print the different formats, and bail when we try to program 0x0000120
to the card. This may cause side effects so do _not_ install, but rather
specify the location of the local/new nouveau_dri.so via the LIBGL_DRIVERS_PATH
variable.

ex.
LIBGL_DRIVERS_PATH=/home/emo/mesa/build/lib/gallium firefox &gt;&amp; fdo73358.log</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389906837.DA612.2123--

--===============0590962152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0590962152==--
