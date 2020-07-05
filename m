From: "Michael T. Kloos" <michael-RKkoRtUCbzKq0/6D4rpXzw@public.gmane.org>
Subject: Framebuffer double buffering (via FBIOPAN_DISPLAY)
Date: Sun, 5 Jul 2020 03:34:11 -0400
Message-ID: <8e6b4c97-41fa-ffaa-3580-1eee8d7d54f3@michaelkloos.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0359960058=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Language: en-US
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

This is a multi-part message in MIME format.
--===============0359960058==
Content-Type: multipart/alternative;
 boundary="------------FDE9095653B137677652E801"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------FDE9095653B137677652E801
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Does NOUVEAU support mmaping a double-sized Framebuffer?
When attempting to run, where fd refers to "/dev/fb0":

mmap(ptr, screensize * 2, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);

I get back an invalid argument error.  This doesn't happen if I only
request a single screensize.  Is this a limitation of the driver?


--------------FDE9095653B137677652E801
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Does NOUVEAU support mmaping a double-sized Framebuffer?
When attempting to run, where fd refers to "/dev/fb0":

mmap(ptr, screensize * 2, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);

I get back an invalid argument error.  This doesn't happen if I only 
request a single screensize.  Is this a limitation of the driver?
</pre>
  </body>
</html>

--------------FDE9095653B137677652E801--

--===============0359960058==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0359960058==--
