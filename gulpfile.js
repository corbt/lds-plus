var gulp = require('gulp');
  coffee = require('gulp-coffee');
    sass = require('gulp-sass');

gulp.task('default', ['coffee','scss']);

gulp.task('watch', function(){
  gulp.watch('./sources/coffees/**/*.coffee',['coffee']);
  gulp.watch('./sources/sasses/**/*.scss',['scss']);
});

gulp.task('coffee', function(){
  gulp.src('./sources/coffees/**/*.coffee')
    .pipe(coffee({bare: true}))
    .pipe(gulp.dest('./extension/javascripts'))
});

gulp.task('scss', function(){
  gulp.src('./sources/sasses/**/*.scss')
    .pipe(sass())
    .pipe(gulp.dest('./extension/stylesheets'))
});

