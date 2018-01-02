From: Daniel Boyd <danieljboyd-mVuRI66OGLPQT0dZR+AlfA@public.gmane.org>
Subject: Hard lock with 4.14.0-2
Date: Tue, 02 Jan 2018 13:43:06 -0600
Message-ID: <1514922186.2867.10.camel@icloud.com>
Reply-To: danieljboyd-mVuRI66OGLPQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0173837217=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0173837217==
Content-type: multipart/alternative; boundary="=-RU0VUIg5yQEhcJwK9y9H"


--=-RU0VUIg5yQEhcJwK9y9H
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I am running Debian testing and updated my system this morning which
included a new kernel: 4.14.0.2-amd64

After this update, my system froze twice -- both times the exact same
behavior.

In both situations, the system froze while I was resizing a window. 
The mouse cursor froze, clock stopped, num lock stopped working.  I
didn't check if the system responded to pings from a remote machine,
but I can check that if it would be helpful.  I reverted back to my
previous kernel and everything appears to be fine.

My system:
Lenovo ThinkPad W530
NVidia Quadro K1000M
GNOME Shell 3.26.2 / wayland
--=-RU0VUIg5yQEhcJwK9y9H
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html><head></head><body><div>I am running Debian testing and updated my system this morning which included a new kernel: 4.14.0.2-amd64</div><div><br></div><div>After this update, my system froze twice -- both times the exact same behavior.</div><div><br></div><div>In both situations, the system froze while I was resizing a window.  The mouse cursor froze, clock stopped, num lock stopped working.  I didn't check if the system responded to pings from a remote machine, but I can check that if it would be helpful.  I reverted back to my previous kernel and everything appears to be fine.</div><div><br></div><div>My system:</div><div>Lenovo ThinkPad W530</div><div>NVidia Quadro K1000M</div><div>GNOME Shell 3.26.2 / wayland</div></body></html>
--=-RU0VUIg5yQEhcJwK9y9H--


--===============0173837217==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0173837217==--
